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
    @years = Service.select("created_at").map{ |i| i.created_at.year }.uniq.sort
    @year = params[:year] || Date.current.year
    date = DateTime.new(@year.to_i, 6, 30) # just a date in the middle of the year

  	@services = Service.all
  	@buses = Bus.all
  	@receipts = Receipt.all
  	@gas = Ga.all
  	@costs = @services + @receipts
  end
end
