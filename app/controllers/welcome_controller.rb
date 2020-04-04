class WelcomeController < ApplicationController
	before_action :authenticate_user!

	def index
    @active1 = "active"

    data = {}

    data[:quotations] = []
    quotations = current_user.company.quotations.group_by_month('quotations.created_at', last: 12, format: "%b").count
    quotations.each do |key, value|
      data[:quotations] << { year: key, value: value }
    end

    data[:records] = {}
    records = current_user.company.records.group_by_month('records.created_at', last: 12, format: "%b'%y").count
    data[:records][:labels] = records.keys
    data[:records][:data] = records.values

    data[:services] = []
    services = current_user.company.services.group_by_month('services.created_at', last: 12, format: "%b").count
    services.each do |key, value|
      data[:services] << { year: key, value: value }
    end

    data[:receipts] = {}
    receipts = current_user.company.receipts.group_by_month('receipts.fecha', last: 12, format: "%b'%y").sum('receipts.cantidad')
    data[:receipts][:labels] = receipts.keys
    data[:receipts][:data] = receipts.values

    data[:income] = {}
    income = current_user.company.records.group_by_month('records.start_time', last: 12, format: "%b'%y").sum('records.precio_final')
    data[:income][:labels] = income.keys
    data[:income][:data] = income.values

    data[:buses] = []
    total_buses = current_user.company.buses.count
    (Date.today-30.days..Date.today).each do |date|
      booked_buses = current_user.company.buses.joins(:records).where("((records.start_time >= :start AND records.start_time <= :end) OR (records.end_time >= :start AND records.end_time <= :end)) OR (records.start_time < :start AND records.end_time > :end)", {start: date.beginning_of_day, end: date.end_of_day}).pluck(:id).uniq.count
      data[:buses] << {
        year: date.strftime("%e"),
        value: (booked_buses.to_f / total_buses * 100).to_i
      }
    end

    @data = data

    # Free buses today
    all_buses = current_user.company.buses.pluck(:numero)

    booked_buses = current_user.company.buses.joins(:records).where("((records.start_time >= :start AND records.start_time <= :end) OR (records.end_time >= :start AND records.end_time <= :end)) OR (records.start_time < :start AND records.end_time > :end)", {start: Date.today.beginning_of_day, end: Date.today.end_of_day}).pluck(:numero).uniq
    @free_buses = (all_buses - booked_buses).first(10)

    # Free buses this month
    all_buses = current_user.company.buses

    free_buses_month = {}
    all_buses.each do |bus|
      records = bus.records.where("((records.start_time >= :start AND records.start_time <= :end) OR (records.end_time >= :start AND records.end_time <= :end)) OR (records.start_time < :start AND records.end_time > :end)", {start: Date.today.beginning_of_month, end: Date.today.end_of_month}).pluck(:start_time,:end_time)

      booked_days = 0
      records.each do |start_time, end_time|
        if start_time < Date.today.beginning_of_month
          start_time = Date.today.beginning_of_month
        end

        if end_time > Date.today.end_of_month
          end_time = Date.today.end_of_month
        end

        booked_days += (end_time.to_date - start_time.to_date + 1).to_i
      end
      free_days = 30 - booked_days
      free_buses_month[bus.numero] = free_days
    end
    @free_buses_month = free_buses_month.sort_by {|_key, value| value}.reverse.first(10).to_h

    # Free buses this year
    all_buses = current_user.company.buses

    free_buses_year = {}
    all_buses.each do |bus|
      records = bus.records.where("((records.start_time >= :start AND records.start_time <= :end) OR (records.end_time >= :start AND records.end_time <= :end)) OR (records.start_time < :start AND records.end_time > :end)", {start: Date.today.beginning_of_year, end: Date.today.end_of_year}).pluck(:start_time, :end_time)

      booked_days = 0
      records.each do |start_time, end_time|
        if start_time < Date.today.beginning_of_year
          start_time = Date.today.beginning_of_year
        end

        if end_time > Date.today.end_of_year
          end_time = Date.today.end_of_year
        end

        booked_days += (end_time.to_date - start_time.to_date + 1).to_i
      end
      free_days = 365 - booked_days
      free_buses_year[bus.numero] = free_days
    end
    @free_buses_year = free_buses_year.sort_by {|_key, value| value}.reverse.first(10).to_h

    # Last users login
    @users = current_user.company.users

    # Quotations created vs closed
    @quotations_created = current_user.company.quotations.group_by_day('quotations.created_at', last: 30, format: "%e").count
    @quotations_closed = current_user.company.quotations.group_by_day('quotations.fecha_fin', last: 30, format: "%e").count
  end


  def reporte
    @active14 = "active pcoded-trigger"

    @years = current_user.company.services.select("created_at").map{ |i| i.created_at.year }.uniq.sort
    @year = params[:year] || Date.current.year

    @months = Array(1..12)
    if @year.to_s == Date.current.year.to_s
      @month = params[:month] || Date.current.month
    else
      @month = 12
    end

    date = DateTime.new(@year.to_i, @month.to_i, 15) # just a date in the middle of the month

  	@services = current_user.company.services
      .where("services.fecha > :start AND services.fecha < :end", {start: date.beginning_of_month, end: date.end_of_month})
  	@buses = Bus.all
  	@receipts = current_user.company.receipts
      .where("receipts.fecha > :start AND receipts.fecha < :end", {start: date.beginning_of_month, end: date.end_of_month})
  	@gas = Ga.all
  	@costs = @services + @receipts
  end
end
