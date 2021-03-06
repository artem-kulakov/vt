class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @active15 = 'active pcoded-trigger'

    if current_user.super_admin
      @companies = Company.all
    @q = @companies.ransack(params[:q])
    @companies = @q.result.distinct
    @companies = @companies.order('id ASC').paginate(:page => params[:page], :per_page => 30)

    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    if current_user.super_admin?
      @active15 = 'active pcoded-trigger'
    else
      redirect_to current_user.company
    end
  end

  # GET /companies/new
  def new
    if current_user.super_admin?
      @active15 = 'active pcoded-trigger'
      @company = Company.new
    else
      redirect_to edit_company_path(current_user.company)
    end
  end

  # GET /companies/1/edit
  def edit
    @active15 = 'active pcoded-trigger'

    @company = Company.find(current_user.company.id)
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to edit_company_path(current_user.company), notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:razon_social, :name, :address, :industry, :rfc, :alias, :company_type, :cadena_verificacion, :type_a_name, :type_a_km_cost, :type_a_day_cost, :type_b_name, :type_b_km_cost, :type_b_day_cost, :type_c_name, :type_c_km_cost, :type_c_day_cost, :type_d_name, :type_d_km_cost, :type_d_day_cost, :logo)
    end
end
