class WelcomeController < ApplicationController
  def index
  	@services = Service.all
  	@buses = Bus.all
  	@receipts = Receipt.all
  	@gas = Ga.all
  	@costs = @services + @receipts
  end
end
