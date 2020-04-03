class WelcomeController < ApplicationController
	before_action :authenticate_user!
	def index
    @active1 = "active"

    data = {}

    data[:quotations] = {}
    quotations = current_user.company.quotations.group_by_month('quotations.created_at', last: 12, format: "%b'%y").count
    data[:quotations][:labels] = quotations.keys
    data[:quotations][:data] = quotations.values

    data[:records] = {}
    records = current_user.company.records.group_by_month('records.created_at', last: 12, format: "%b'%y").count
    data[:records][:labels] = records.keys
    data[:records][:data] = records.values

    data[:services] = {}
    services = Service.group_by_month(:created_at, last: 12, format: "%b'%y").count
    data[:services][:labels] = services.keys
    data[:services][:data] = services.values

    data[:receipts] = {}
    receipts = Receipt.group_by_month(:fecha, last: 12, format: "%b'%y").sum('cantidad')
    data[:receipts][:labels] = receipts.keys
    data[:receipts][:data] = receipts.values

    data[:income] = {}
    income = Record.group_by_month(:start_time, last: 12, format: "%b'%y").sum('precio_final')
    data[:income][:labels] = income.keys
    data[:income][:data] = income.values

    @data = data
  end


  def reporte
    @active14 = "active pcoded-trigger"

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
