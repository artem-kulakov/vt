class WelcomeController < ApplicationController
  def index
  	@services = Service.all
  	@buses = Bus.all
  	@vouchers = Voucher.all

  	@costs = @services
  end
end
