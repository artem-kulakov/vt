class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :itinerary, :update, :destroy]
  before_action :authenticate_user!

  # GET /quotations
  # GET /quotations.json
  def index
    @years = Quotation.select("created_at").map{ |i| i.created_at.year }.uniq.sort

    @year = params[:year] || Date.current.year
    date = DateTime.new(@year.to_i, 6, 30) # just a date in the middle of the year

    @q = Quotation.where("created_at > :start AND created_at < :end", {start: date.beginning_of_year, end: date.end_of_year}).ransack(params[:q])
    @quotations = @q.result.distinct
    @quotations = @quotations.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
    @company = Company.first

    @places = @quotation.places
    @place = Place.new

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "quotation",
        viewport_size: '1280x1024',
        show_as_html: params.key?('debug'),
        footer: { html: { template: "shared/footer.pdf.erb" } }
      end
    end
  end

  # GET /quotations/new
  def new
    @step_1_active = "active"
    @quotation = Quotation.new
  end

  # GET /quotations/:id/itinerary
  def itinerary
    @step_2_active = "active"
    @place = Place.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)
    @quotation.user_id = current_user.id

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { respond_with_bip(@quotation) }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@quotation) }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:nombre, :telefono, :email, :origen, :num_dias, :fecha_inicio, :fecha_fin, :pasajeros, :distancia, :observaciones, :user_id, :segmento1, :dia_extra1, :segmento2, :dia_extra2, :segmento3, :dia_extra3, :segmento4, :dia_extra4)
    end
end
