class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /records
  # GET /records.json
  def index
    @q = Record.ransack(params[:q])
    @records = @q.result.includes(:services, :buses, :client).uniq

    @records = @records.where("created_at < ?", 1.year.ago)

    @records = @records.order('id ASC').paginate(:page => params[:page], :per_page => 30)

    @buses = Bus.all
  end

  def cobranza
    @q = Client.ransack(params[:q])
    @clients = @q.result.uniq
    @clients = Client.joins(:records).where({ "records.status_admin" => false }).uniq.paginate(:page => params[:page], :per_page => 30)
  end

  def pizarron
    @buses = Bus.all.order("created_at asc")
    @records = Record.all
    @services = Service.all
    @records = @records.where("created_at > ?", 10.days.ago)
  end

  def operaciones
    @records = Record.where("start_time >= ?", Time.zone.now.beginning_of_day).order('id ASC').paginate(:page => params[:page], :per_page => 30)
    @records = @records.where("created_at < ?", 1.year.ago)
  end

  def registro
    @services = Service.all.order("created_at asc").paginate(:page => params[:page], :per_page => 30)
    @services = @services.where("created_at < ?", 1.year.ago)
  end

  def reportes
    
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @payments = @record.payments
    @payment = Payment.new

    @service = Service.new
    @services = @record.services
    
    @routes = @record.routes
    @route = Route.new
  end

  # GET /records/new
  def new
    @record = Record.new
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
      params.require(:record).permit(:start_time, :end_time, :initial_time, :finish_time, :title, :client_id, :user_id, :numero_pasajeros, :numero_de_camiones, :lugar_salida, :referencia_salida, :nombre_referencia, :telefono_referencia, :precio, :precio_final, :factura, :num_factura, :status_op, :status_admin, :observaciones, :distancia)
    end
end
