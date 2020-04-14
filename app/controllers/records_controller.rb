class RecordsController < ApplicationController
  before_action :set_record, only: [:client, :itinerary, :trip, :bus, :price, :payments, :pdf, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /records
  # GET /records.json
  def index
    @active13 = "active pcoded-trigger"

    @years = current_user.company.records.select("records.created_at").map{ |i| i.created_at.year }.uniq.sort
    @year = params[:year] || Date.current.year
    date = DateTime.new(@year.to_i, 6, 30) # just a date in the middle of the year

    @q = current_user.company.records.ransack(params[:q])
    @records = @q.result.includes(:services, :buses, :client).distinct
    @records = @records
      .order('records.id ASC')
      .where("records.created_at > :start AND records.created_at < :end", {start: date.beginning_of_year, end: date.end_of_year})
      .paginate(:page => params[:page], :per_page => 30)
    @buses = current_user.company.buses
  end

  def cobranza
    @active4 = "active pcoded-trigger"

    @years = current_user.company.records.select("records.created_at").map{ |i| i.created_at.year }.uniq.sort

    @year = params[:year] || Date.current.year
    date = DateTime.new(@year.to_i, 6, 30) # just a date in the middle of the year

    @q = current_user.company.clients.ransack(params[:q])
    @clients = @q.result.distinct
    @clients = current_user.company.clients
      .joins(:records)
      .where("records.created_at > :start AND records.created_at < :end", {start: date.beginning_of_year, end: date.end_of_year})
      .where({ "records.status_admin" => false })
      .uniq
      .paginate(:page => params[:page], :per_page => 30)
  end

  def pizarron
    @active2 = "active"

    @buses = current_user.company.buses

    start_time = params[:start] ? params[:start].to_time : Time.now
    end_time = params[:end] ? params[:end].to_time : Time.now
    @records = current_user.company.records.where("((records.start_time > :start AND records.start_time < :end) OR (records.end_time > :start AND records.end_time < :end)) OR (records.start_time < :start AND records.end_time > :end)", {start: start_time, end: end_time})

    # Checkups
    @checkups = []
    current_user.company.buses.each do |bus|
      if bus.checkups.preventivo.any?
        last_preventivo_checkup = bus.checkups.preventivo.last.fecha_fin
        services_after_preventivo_checkup = bus.services.where('services.fecha > ?', last_preventivo_checkup)
        kms_since_preventivo_checkup = services_after_preventivo_checkup.sum(:km_finales)
        preventivo_checkup_needed = kms_since_preventivo_checkup >= bus.kms_servicio_preventivo
      end

      if bus.checkups.correctivo.any?
        last_correctivo_checkup = bus.checkups.correctivo.last.fecha_fin
        services_after_correctivo_checkup = bus.services.where('services.fecha > ?', last_correctivo_checkup)
        kms_since_correctivo_checkup = services_after_correctivo_checkup.sum(:km_finales)
        correctivo_checkup_needed = kms_since_correctivo_checkup >= bus.kms_servicio_correctivo
      end

      if preventivo_checkup_needed || correctivo_checkup_needed

        if preventivo_checkup_needed
          start_time = services_after_preventivo_checkup.order(:fecha).last.record.end_time
        else
          start_time = services_after_correctivo_checkup.order(:fecha).last.record.end_time
        end

        @checkups << {
          start_time: start_time,
          bus_id: bus.id
        }
      end
    end
  end

  def operaciones
    @active4 = "active pcoded-trigger"

    @records = current_user.company.records.where("records.start_time >= ?", Time.zone.now.beginning_of_day).order('records.id ASC').paginate(:page => params[:page], :per_page => 30)
    # @records = @records.where("created_at < ?", 1.year.ago)
  end

  def registro
    @services = Service.all.order("created_at asc").paginate(:page => params[:page], :per_page => 30)
  end

  def reportes
    
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @company = Company.first

    @payments = @record.payments
    @payment = Payment.new

    @service = Service.new
    @services = @record.services
    
    @routes = @record.routes
    @route = Route.new

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "service",
        viewport_size: '1280x1024',
        show_as_html: params.key?('debug'),
        footer: { html: { template: "shared/footer.pdf.erb" } }
      end
    end
  end

  # GET /records/new
  def new
    @active4 = "active pcoded-trigger"

    @step_1_active = "active"
    @record = Record.new
  end

  def client
    @active4 = "active pcoded-trigger"

    @step_2_active = "active"

    @q = current_user.company.clients.ransack(params[:q])
    @clients = @q.result.distinct
    @clients = @clients.order('id ASC').paginate(:page => params[:page], :per_page => 30)
  end

  def itinerary
    @active4 = "active pcoded-trigger"

    @step_3_active = "active"

    @routes = @record.routes
    @route = Route.new
  end

  def trip
    @active4 = "active pcoded-trigger"

    @step_4_active = "active"
  end

  def bus
    @active4 = "active pcoded-trigger"

    @step_5_active = "active"

    buses = current_user.company.buses.pluck(:id)
    booked_buses = current_user.company.buses.joins(:records).where("records.start_time >= ? AND records.end_time <= ?", @record.start_time, @record.end_time).pluck(:id)
    free_buses = buses - booked_buses

    # Checkups
    available_buses = []
    current_user.company.buses.where(id: free_buses).each do |bus|
      if bus.checkups.preventivo.any?
        last_preventivo_checkup = bus.checkups.preventivo.last.fecha_fin
        services_after_preventivo_checkup = bus.services.where('services.fecha > ?', last_preventivo_checkup)
        kms_since_preventivo_checkup = services_after_preventivo_checkup.sum(:km_finales)

        preventivo_checkup_not_needed = kms_since_preventivo_checkup < bus.kms_servicio_preventivo
      else
        preventivo_checkup_needed = true
      end

      if bus.checkups.correctivo.any?
        last_correctivo_checkup = bus.checkups.correctivo.last.fecha_fin
        services_after_correctivo_checkup = bus.services.where('services.fecha > ?', last_correctivo_checkup)
        kms_since_correctivo_checkup = services_after_correctivo_checkup.sum(:km_finales)

        correctivo_checkup_not_needed = kms_since_correctivo_checkup < bus.kms_servicio_correctivo
      else
        correctivo_checkup_needed = true
      end


      if preventivo_checkup_not_needed && correctivo_checkup_not_needed
        available_buses << bus.id
      end
    end

    @available_buses = current_user.company.buses.where(id: available_buses).collect { |p| [ "#{p.numero}, #{p.version} - #{p.capacidad} pasajeros", p.id ] }

    @service = Service.new
    @services = @record.services
  end

  def price
    @active4 = "active pcoded-trigger"

    @step_6_active = "active"
  end

  def payments
    @active4 = "active pcoded-trigger"

    @step_7_active = "active"

    @payments = @record.payments
    @payment = Payment.new
  end

  def pdf
    @active4 = "active pcoded-trigger"

    @step_8_active = "active"
  end

  # GET /records/1/edit
  def edit
    @step_1_active = "active"
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id

    respond_to do |format|
      if @record.save
        format.html { redirect_to client_record_path(@record), notice: 'Record was successfully created.' }
        format.json { respond_with_bip(@record) }
      else
        format.html { render :new }
        format.json { respond_with_bip(@record) }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        step = params[:step].to_i

        if step == 1
          path = client_record_path(@record)
        elsif step == 2
          path = itinerary_record_path(@record)
        elsif step == 3
          path = trip_record_path(@record)
        elsif step == 4
          path = bus_record_path(@record)
        elsif step == 5
          path = price_record_path(@record)
        elsif step == 6
          path = payments_record_path(@record)
        elsif step == 7
          path = pdf_record_path(@record)
        end

        format.html { redirect_to path, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:start_time, :end_time, :initial_time, :finish_time, :title, :client_id, :user_id, :numero_pasajeros, :numero_de_camiones, :lugar_salida, :referencia_salida, :nombre_referencia, :telefono_referencia, :precio, :precio_final, :factura, :num_factura, :status_op, :status_admin, :observaciones, :condiciones, :distancia, :status)
    end
end
