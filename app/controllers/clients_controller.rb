class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /clients
  # GET /clients.json
  def index
    @active8 = "active pcoded-trigger"

    @q = current_user.company.clients.ransack(params[:q])
    @clients = @q.result.distinct
    @clients = @clients.order('id ASC').paginate(:page => params[:page], :per_page => 30)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @active8 = "active pcoded-trigger"

    @records = @client.records.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /clients/new
  def new
    @active8 = "active pcoded-trigger"

    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:user_id, :alias, :razon_social, :rfc, :calle_y_numero, :colonia, :municipio, :estado, :cp, :pais, :telefono, :email, :nombre_cobro, :telefono_cobro, :email_cobro, :address)
    end
end
