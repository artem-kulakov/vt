class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_record, except: [:index]
  before_action :authenticate_user!

  # GET /services
  # GET /services.json
  def index
    @active5 = "active pcoded-trigger"

    @years = current_user.company.services.select("services.created_at").map{ |i| i.created_at.year }.uniq.sort

    @year = params[:year] || Date.current.year
    date = DateTime.new(@year.to_i, 6, 30) # just a date in the middle of the year

    @q = current_user.company.services
      .where("services.created_at > :start AND services.created_at < :end", {start: date.beginning_of_year, end: date.end_of_year})
      .ransack(params[:q])
    @services = @q.result.distinct
    @services = @services.order('services.id ASC').paginate(:page => params[:page], :per_page => 30)
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    @service.record_id = @record.id
    

    respond_to do |format|
      if @service.save
        format.html { redirect_to bus_record_path(@record), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to bus_record_path(@record), notice: 'Service was successfully updated.' }
        format.json { respond_with_bip(@service) }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@service) }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to bus_record_path(@record), notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_record
      @record = Record.find(params[:record_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:bus_id, :operator_id, :record_id, :user_id, :caseta, :hotel, :viaticos, :estacionamientos, :lavadas, :aeropuerto, :diesel, :otros, :km_inicio, :km_fin, :precio_unidad, :dia_extra, :suma, :factor)
    end
end
