class BusesController < ApplicationController
  before_action :set_bus, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /buses
  # GET /buses.json
  def index
    @active10 = "active pcoded-trigger"

    @buses = current_user.company.buses
  end

  # GET /buses/1
  # GET /buses/1.json
  def show
  end

  # GET /buses/new
  def new
    authorize! :read, @bus

    @active10 = "active pcoded-trigger"

    @bus = Bus.new
  end

  # GET /buses/1/edit
  def edit
  end

  # POST /buses
  # POST /buses.json
  def create
    authorize! :create, @bus

    @bus = Bus.new(bus_params)
    @bus.user_id = current_user.id

    Checkup.create(
      bus: @bus,
      category: 'preventivo',
      fecha_inicio: params[:checkup_date],
      fecha_fin: params[:checkup_date]
    )

    Checkup.create(
      bus: @bus,
      category: 'correctivo',
      fecha_inicio: params[:checkup_date],
      fecha_fin: params[:checkup_date]
    )

    respond_to do |format|
      if @bus.save
        format.html { redirect_to buses_path, notice: 'Bus was successfully created.' }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buses/1
  # PATCH/PUT /buses/1.json
  def update
    @bus.user_id = current_user.id
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to buses_path, notice: 'Bus was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buses/1
  # DELETE /buses/1.json
  def destroy
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: 'Bus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus
      @bus = Bus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_params
      params.require(:bus).permit(:numero, :marca, :capacidad, :modelo, :placa, :version, :user_id, :operator_id, :kms_servicio_preventivo, :kms_servicio_correctivo)
    end
end
