class WelcomeController < ApplicationController
	before_action :authenticate_user!
	def index
    @services = Service.all
    @buses = Bus.all
    @receipts = Receipt.all
    @gas = Ga.all
    @costs = @services + @receipts
  end


  def reporte
  	@services = Service.all
  	@buses = Bus.all
  	@receipts = Receipt.all
  	@gas = Ga.all
  	@costs = @services + @receipts
  end
end
