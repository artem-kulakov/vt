# frozen_string_literal: true

class OperatorsController < ApplicationController
  before_action :set_operator, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /operators
  # GET /operators.json
  def index
    @active9 = 'active pcoded-trigger'

    @operators = current_user.company.operators
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
    @vouchers = @operator.vouchers
  end

  # GET /operators/new
  def new
    authorize! :read, @bus

    @active9 = 'active pcoded-trigger'

    @operator = Operator.new
  end

  # GET /operators/1/edit
  def edit
    authorize! :edit, @bus
  end

  # POST /operators
  # POST /operators.json
  def create
    authorize! :create, @bus

    @operator = Operator.new(operator_params)
    @operator.user_id = current_user.id

    respond_to do |format|
      if @operator.save
        format.html { redirect_to @operator, notice: 'Operator was successfully created.' }
        format.json { render :show, status: :created, location: @operator }
      else
        format.html { render :new }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operators/1
  # PATCH/PUT /operators/1.json
  def update
    authorize! :update, @bus

    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to @operator, notice: 'Operator was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator }
      else
        format.html { render :edit }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operators/1
  # DELETE /operators/1.json
  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to operators_url, notice: 'Operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_operator
    @operator = Operator.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def operator_params
    params.require(:operator).permit(:nombre, :telefono, :papeles, :user_id, :observaciones, :validez, :licencia)
  end
end
