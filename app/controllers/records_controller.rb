class RecordsController < ApplicationController
  before_action :set_record, only: [:client, :itinerary, :trip, :bus, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /records
  # GET /records.json
  def index
    @years = Record.select("created_at").map{ |i| i.created_at.year }.uniq.sort
    @year = params[:year] || Date.current.year
    date = DateTime.new(@year.to_i, 6, 30) # just a date in the middle of the year

    @q = Record.ransack(params[:q])
    @records = @q.result.includes(:services, :buses, :client).distinct
    @records = @records
      .order('id ASC')
      .where("records.created_at > :start AND records.created_at < :end", {start: date.beginning_of_year, end: date.end_of_year})
      .paginate(:page => params[:page], :per_page => 30)
    @buses = Bus.all
  end

  def cobranza
    @years = Record.select("created_at").map{ |i| i.created_at.year }.uniq.sort

    @year = params[:year] || Date.current.year
    date = DateTime.new(@year.to_i, 6, 30) # just a date in the middle of the year

    @q = Client.ransack(params[:q])
    @clients = @q.result.distinct
    @clients = Client
      .joins(:records)
      .where("records.created_at > :start AND records.created_at < :end", {start: date.beginning_of_year, end: date.end_of_year})
      .where({ "records.status_admin" => false })
      .uniq
      .paginate(:page => params[:page], :per_page => 30)
  end

  def pizarron
    start_time = params[:start] ? params[:start].to_time : Time.now

    @records = Record.where("((start_time > :start AND start_time < :end) OR (end_time > :start AND end_time < :end)) OR (start_time < :start AND end_time > :end)", {start: start_time.beginning_of_month, end: start_time.end_of_month})

    colors = [
      '#04a9f5',
      '#f44236',
      '#f4c22b',
      '#3ebfea',
      '#1de9b6',
      '#a389d4'
    ]

    @events = []

    @records.each do |record|
      color = colors.sample
      @events << {
          title: record.title,
          url: record_url(record),
          start: record.start_time,
          end: record.end_time,
          borderColor: color,
          backgroundColor: color,
          textColor: '#fff'
      }
    end
  end

  def operaciones
    @records = Record.where("start_time >= ?", Time.zone.now.beginning_of_day).order('id ASC').paginate(:page => params[:page], :per_page => 30)
    @records = @records.where("created_at < ?", 1.year.ago)
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
    @step_1_active = "active"
    @record = Record.new
  end

  def client
    @step_2_active = "active"

    @clients = Client.all
  end

  def itinerary
    @step_3_active = "active"

    @routes = @record.routes
    @route = Route.new
  end

  def trip
    @step_4_active = "active"
  end

  def bus
    @step_5_active = "active"

    buses = Bus.all.pluck(:id)
    booked_buses = Bus.joins(:records).where("records.start_time >= ? AND records.end_time <= ?", @record.start_time, @record.end_time).pluck(:id)
    free_buses = buses - booked_buses
    @free_buses = Bus.where(id: free_buses).collect { |p| [ "#{p.numero}, #{p.version} - #{p.capacidad} pasajeros", p.id ] }

    @service = Service.new
    @services = @record.services
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
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
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
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
      params.require(:record).permit(:start_time, :end_time, :initial_time, :finish_time, :title, :client_id, :user_id, :numero_pasajeros, :numero_de_camiones, :lugar_salida, :referencia_salida, :nombre_referencia, :telefono_referencia, :precio, :precio_final, :factura, :num_factura, :status_op, :status_admin, :observaciones, :condiciones, :distancia)
    end
end
