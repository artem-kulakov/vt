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
    # @costs = @costs
    #   .paginate(:page => params[:page], :per_page => 20)
      # .where("created_at > :start AND created_at < :end", {start: date.beginning_of_year, end: date.end_of_year})
  end
end
