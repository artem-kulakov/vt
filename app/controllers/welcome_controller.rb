class WelcomeController < ApplicationController
  def index
  	@services = Service.all
  	@buses = Bus.all

  	@costs = @services
  end
end
