class WelcomeController < ApplicationController
  def index
  	@services = Service.all
  	@buses = Bus.all
  	@receipts = Receipt.all
  	@costs = @services + @receipts
  end
end
