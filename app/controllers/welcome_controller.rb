class WelcomeController < ApplicationController
	before_action :authenticate_user!
	def index
    @services = Service.all
    @buses = Bus.all
    @receipts = Receipt.all
    @gas = Ga.all
    @costs = @services + @receipts



    data = {}

    data[:quotations] = {}
    quotations = Quotation.group_by_month(:created_at, last: 12, format: "%b'%y").count
    data[:quotations][:labels] = quotations.keys
    data[:quotations][:data] = quotations.values

    $data = data

    @temp = $data
  end


  def reporte
    @years = Service.select("created_at").map{ |i| i.created_at.year }.uniq.sort
    @year = params[:year] || Date.current.year

    @months = Array(1..12)
    if @year.to_s == Date.current.year.to_s
      @month = params[:month] || Date.current.month
    else
      @month = 12
    end

    date = DateTime.new(@year.to_i, @month.to_i, 15) # just a date in the middle of the month

  	@services = Service
      .where("fecha > :start AND fecha < :end", {start: date.beginning_of_month, end: date.end_of_month})
  	@buses = Bus.all
  	@receipts = Receipt
      .where("fecha > :start AND fecha < :end", {start: date.beginning_of_month, end: date.end_of_month})
  	@gas = Ga.all
  	@costs = @services + @receipts
  end
end
