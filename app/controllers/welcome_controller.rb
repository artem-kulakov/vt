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

    data[:receipts] = []
    receipts = current_user.company.receipts.group_by_month('receipts.fecha', last: 12, format: "%b'%y").sum('receipts.cantidad')
    receipts.each do |key, value|
      data[:receipts] << { year: key, value: value }
    end


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
        value: booked_buses == 0 || total_buses == 0 ? 0 : (booked_buses.to_f / total_buses * 100).to_i
      }
    end

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
    data[:quotations_created] = []

    quotations_created = current_user.company.quotations.group_by_day('quotations.created_at', last: 30, format: "%e").count
    quotations_closed = current_user.company.quotations.group_by_day('quotations.fecha_fin', last: 30, format: "%e").count

    quotations_created.each do |key, value|
      data[:quotations_created] << { year: key, value: value, value2: quotations_closed[key] }
    end

    # Records created vs closed
    data[:records_created] = []

    records_created = current_user.company.records.group_by_day('records.created_at', last: 30, format: "%e").count
    records_closed = current_user.company.records.group_by_day('records.end_time', last: 30, format: "%e").count

    records_created.each do |key, value|
      data[:records_created] << { year: key, value: value, value2: records_closed[key] }
    end

    # Monthly quotations
    @quotations_last_30_days = current_user.company.quotations.where("((quotations.fecha_inicio >= :start AND quotations.fecha_inicio <= :end) OR (quotations.fecha_fin >= :start AND quotations.fecha_fin <= :end)) OR (quotations.fecha_inicio < :start AND quotations.fecha_fin > :end)", {start: Date.today-1.month, end: Date.today}).count
    quotations_previous_30_days = current_user.company.quotations.where("((quotations.fecha_inicio >= :start AND quotations.fecha_inicio <= :end) OR (quotations.fecha_fin >= :start AND quotations.fecha_fin <= :end)) OR (quotations.fecha_inicio < :start AND quotations.fecha_fin > :end)", {start: Date.today-2.month, end: Date.today-1.month}).count
    @quotations_change = ((@quotations_last_30_days.to_f / quotations_previous_30_days - 1) * 100).to_i

    # Monthly services
    @services_last_30_days = current_user.company.services.where("services.fecha >= :start AND services.fecha <= :end", {start: Date.today-1.month, end: Date.today}).count
    services_previous_30_days = current_user.company.services.where("services.fecha >= :start AND services.fecha <= :end", {start: Date.today-2.month, end: Date.today-1.month}).count
    @services_change = ((@services_last_30_days.to_f / services_previous_30_days - 1) * 100).to_i

    # Quotations status
    data[:quotations_status] = []

    quotations = current_user.company.quotations
    @quotations_abierto = quotations.where(status: 'Abierto').count
    @quotations_itinerario = quotations.where(status: 'Itinerario').count
    @quotations_distancia = quotations.where(status: 'Distancia').count
    @quotations_precios = quotations.where(status: 'Precios').count
    @quotations_cerrado = quotations.where(status: 'Cerrado').count

    data[:quotations_status] << {
      game: 'Abierto',
      visits: @quotations_abierto,
      color: ["#1de9b6", "#1dc4e9"]
    }
    data[:quotations_status] << {
      game: 'Itinerario',
      visits: @quotations_itinerario,
      color: ["#a389d4", "#899ed4"]
    }
    data[:quotations_status] << {
      game: 'Distancia',
      visits: @quotations_distancia,
      color: ["#04a9f5", "#049df5"]
    }
    data[:quotations_status] << {
      game: 'Precios',
      visits: @quotations_precios,
      color: ["#f44236", "#f48f36"]
    }
    data[:quotations_status] << {
      game: 'Cerrado',
      visits: @quotations_cerrado,
      color: ["#1de9b6", "#1dc4e9"]
    }

    # Records status
    data[:records_status] = []

    records = current_user.company.records
    @records_abierto = records.where(status: 'Abierto').count
    @records_cliente = records.where(status: 'Cliente').count
    @records_itinerario = records.where(status: 'Itinerario').count
    @records_adicional = records.where(status: 'Adicional').count
    @records_autobuses = records.where(status: 'Autobuses').count
    @records_precios = records.where(status: 'Precios').count
    @records_pagos = records.where(status: 'Pagos').count
    @records_cerrado = records.where(status: 'Cerrado').count

    data[:records_status] << {
      game: 'Abierto',
      visits: @records_abierto,
      color: ["#1de9b6", "#1dc4e9"]
    }
    data[:records_status] << {
      game: 'Cliente',
      visits: @records_cliente,
      color: ["#a389d4", "#899ed4"]
    }
    data[:records_status] << {
      game: 'Itinerario',
      visits: @records_itinerario,
      color: ["#04a9f5", "#049df5"]
    }
    data[:records_status] << {
      game: 'Adicional',
      visits: @records_adicional,
      color: ["#f44236", "#f48f36"]
    }
    data[:records_status] << {
      game: 'Autobuses',
      visits: @records_autobuses,
      color: ["#1de9b6", "#1dc4e9"]
    }
    data[:records_status] << {
      game: 'Precios',
      visits: @records_precios,
      color: ["#a389d4", "#899ed4"]
    }
    data[:records_status] << {
      game: 'Pagos',
      visits: @records_pagos,
      color: ["#04a9f5", "#049df5"]
    }
    data[:records_status] << {
      game: 'Cerrado',
      visits: @records_cerrado,
      color: ["#f44236", "#f48f36"]
    }

    # Revenues
    data[:income_year] = []
    income = current_user.company.records.group_by_month('records.start_time', last: 12, format: "%b").sum('records.precio_final')
    income.each do |key, value|
      data[:income_year] << { year: key, value: value }
    end

    # Buses availability
    @buses = current_user.company.buses

    @data = data
  end


  def reporte
    authorize! :read, nil

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
