# Company.delete_all
# User.delete_all

# co1 = Company.create(
#   razon_social: '12345',
#   name: 'Tutto il Mondo',
#   address: 'Some Place'
# )

# co2 = Company.create(
#   razon_social: '54321',
#   name: 'Ajax',
#   address: 'Another Place'
# )

# co3 = Company.create(
#   razon_social: '111',
#   name: 'root'
# )

# a01= User.create!({:email => "gonzalo@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => true, :name => "Gonzalo Jimenez", :puesto => "Director General", :phone => "", company: co1 })
# a02= User.create!({:email => "comercial@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Iván del Toro", :puesto => "Director Comercial", :phone => "55 2981 3313", company: co1 })
# a03= User.create!({:email => "operaciones@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Octavio Aridjis", :puesto => "Director de Operaciones", :phone => "", company: co1 })
# a04= User.create!({:email => "ventas@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => true, :name => "Estefany Rodríguez", :puesto => "Ejecutivo de Venta", :phone => "55 2803 7565", company: co2 })
# a05= User.create!({:email => "administracion@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Alma", :puesto => "Directora Administrativa", :phone => "", company: co2 })
# a06= User.create!({
#   :email => "superadmin@tuttoilmondo.com",
#   :password => "tuttoilmondo",
#   :password_confirmation => "tuttoilmondo",
#   :admin => false,
#   :name => "Pedro",
#   :puesto => "Super Administrator",
#   :phone => "",
#   company: co3,
#   super_admin: true
# })


# o01= Operator.create!({ :nombre => "Jorge Amador"})
# o02= Operator.create!({ :nombre => "Gerardo Ramirez"})
# o03= Operator.create!({ :nombre => "Eleazar Villar"})
# o04= Operator.create!({ :nombre => "Sergio Maquez"})
# o05= Operator.create!({ :nombre => "Pablo Salinas"})
# o06= Operator.create!({ :nombre => "Oscar Ferrer"})
# o07= Operator.create!({ :nombre => "Jose C. Hernandez"})
# o08= Operator.create!({ :nombre => "Salvador Trejo"})
# o09= Operator.create!({ :nombre => "Maximino Guerrero"})
# o10= Operator.create!({ :nombre => "Jose M. Nuñez"})
# o11= Operator.create!({ :nombre => "Mario Perea"})
# o12= Operator.create!({ :nombre => "Francisco Mayen"})
# o13= Operator.create!({ :nombre => "Ernesto Jimenez"})
# o14= Operator.create!({ :nombre => "Carlos Tellez"})
# o15= Operator.create!({ :nombre => "Francisco Jimenez"})
# o16= Operator.create!({ :nombre => "Juan P. Martinez"})
# o17= Operator.create!({ :nombre => "Alejandro Salgado"})
# o18= Operator.create!({ :nombre => "Miaguel A. Sanchez"})
# o19= Operator.create!({ :nombre => "Erick Mendoza"})
# o20= Operator.create!({ :nombre => "Marco A. Rodriguez"})
# o21= Operator.create!({ :nombre => "Antonio Sanchez"})



# b01= Bus.create!({:numero => "11", :marca => "SPRINTER", :capacidad => "19", :modelo => "2013", :placa => "732RP3", :version => "SPRINTER", :operator_id =>1 })
# b02= Bus.create!({:numero => "12", :marca => "SPRINTER", :capacidad => "19", :modelo => "2013", :placa => "731RP3", :version => "SPRINTER", :operator_id =>2 })
# b03= Bus.create!({:numero => "22", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "327RP4", :version => "IRIZAR I6", :operator_id =>3 })
# b04= Bus.create!({:numero => "24", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "060RP7", :version => "IRIZAR I6", :operator_id =>4 })
# b05= Bus.create!({:numero => "26", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "329RP7", :version => "IRIZAR I6", :operator_id =>5 })
# b06= Bus.create!({:numero => "27", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "702RN9", :version => "IRIZAR I6", :operator_id =>6 })
# b07= Bus.create!({:numero => "28", :marca => "VOLVO", :capacidad => "44", :modelo => "2008", :placa => "755RL7", :version => "VOLVO 9700", :operator_id =>7 })
# b08= Bus.create!({:numero => "29", :marca => "VOLVO", :capacidad => "47", :modelo => "2007", :placa => "701RL7", :version => "VOLVO 9700", :operator_id =>8 })
# b09= Bus.create!({:numero => "30", :marca => "SCANIA", :capacidad => "47", :modelo => "2015", :placa => "059RP7", :version => "IRIZAR I6", :operator_id =>9 })
# b10= Bus.create!({:numero => "31", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "677RP9", :version => "IRIZAR I6", :operator_id =>10 })
# b11= Bus.create!({:numero => "32", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "676RP9", :version => "IRIZAR I6", :operator_id =>11 })
# b12= Bus.create!({:numero => "33", :marca => "SCANIA", :capacidad => "51", :modelo => "2016", :placa => "604RR1", :version => "IRIZAR I6", :operator_id =>12 })
# b13= Bus.create!({:numero => "35", :marca => "SCANIA", :capacidad => "47", :modelo => "2015", :placa => "195RR4", :version => "IRIZAR PB", :operator_id =>13 })
# b14= Bus.create!({:numero => "37", :marca => "SCANIA", :capacidad => "53", :modelo => "2007", :placa => "269RJ6", :version => "IRIZAR", :operator_id =>14 })
# b15= Bus.create!({:numero => "38", :marca => "SCANIA", :capacidad => "53", :modelo => "2007", :placa => "270RJ6", :version => "IRIZAR", :operator_id =>15 })
# b16= Bus.create!({:numero => "39", :marca => "SCANIA", :capacidad => "47", :modelo => "2012", :placa => "799RN1", :version => "IRIZAR PB", :operator_id =>16 })
# b41= Bus.create!({:numero => "41", :marca => "SCANIA", :capacidad => "53", :modelo => "2008", :placa => "670RL7", :version => "IRIZAR R", :operator_id =>17 })
# b17= Bus.create!({:numero => "43", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "868RN1", :version => "IRIZAR PB", :operator_id =>18 })
# b18= Bus.create!({:numero => "44", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "869RN1", :version => "IRIZAR PB", :operator_id =>19 })
# b19= Bus.create!({:numero => "45", :marca => "SCANIA", :capacidad => "49", :modelo => "2013", :placa => "870RN1", :version => "IRIZAR PB", :operator_id =>20 })
# b20= Bus.create!({:numero => "46", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "612RR1", :version => "IRIZAR PB", :operator_id =>21 })

# c01= Ga.create!({:cantidad => 10, :mes => 10, :ano => 2017})
# c02= Ga.create!({:cantidad => 10, :mes => 11, :ano => 2017})
# c03= Ga.create!({:cantidad => 10, :mes => 12, :ano => 2017})

# c03= Ga.create!({:cantidad => 10, :mes => 1, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 2, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 3, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 4, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 5, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 6, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 7, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 8, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 9, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 10, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 11, :ano => 2018})
# c03= Ga.create!({:cantidad => 10, :mes => 12, :ano => 2018})

# c03= Ga.create!({:cantidad => 10, :mes => 1, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 2, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 3, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 4, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 5, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 6, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 7, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 8, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 9, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 10, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 11, :ano => 2019})
# c03= Ga.create!({:cantidad => 10, :mes => 12, :ano => 2019})

# c03= Ga.create!({:cantidad => 10, :mes => 1, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 2, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 3, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 4, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 5, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 6, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 7, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 8, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 9, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 10, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 11, :ano => 2020})
# c03= Ga.create!({:cantidad => 10, :mes => 12, :ano => 2020})



### Seed records and services

# Record.delete_all
# Service.delete_all

# record_id = 14586

# Array(2019).each do |year|
#   Array(10..12).each do |month|
#     Array(1..28).each do |day|
#       Bus.all.each do |bus|
#         # record = Record.create(
#         #   start_time: DateTime.new(year, month, day),
#         #   end_time: DateTime.new(year, month, day),
#         #   title: ('a'..'z').to_a.shuffle[0,8].join,
#         #   client_id: 1,
#         #   user_id: 1,
#         #   numero_pasajeros: 5,
#         #   numero_de_camiones: 2,
#         #   precio: 0,
#         #   precio_final: 0,
#         #   factura: false,
#         #   status_op: "Venta",
#         #   status_admin: false,
#         #   distancia: 0
#         # )

#         Service.create(
#           bus_id: bus.id,
#           record_id: record_id,
#           user_id: 1,
#           operator_id: 1
#         )

#         record_id += 1
#       end
#     end
#   end
# end



### Seed quotations

# Quotation.delete_all

# Array(2018..2020).each do |year|
#   Array(1..12).each do |month|
#     Array(1..28).each do |day|
#       Quotation.create(
#         nombre: "Artem Kulakov",
#         telefono: "12345",
#         email: "a@a.com",
#         origen: "Facebook",
#         num_dias: 3,
#         fecha_inicio: DateTime.new(year, month, day),
#         fecha_fin: DateTime.new(year, month, day),
#         user_id: 1,
#         created_at: DateTime.new(year, month, day)
#       )
#     end
#   end
# end



### Seed clients

# Client.delete_all

# id = 1767

# 1764.times do
#   Client.create(
#     user_id: 1,
#     alias: "Mike",
#     razon_social: id,
#     rfc: "foo",
#     calle_y_numero: "White Street",
#     colonia: "Mexico",
#     municipio: "Mexico",
#     estado: "Mexico",
#     cp: "bar",
#     pais: "Mexico",
#     telefono: "123456",
#     email: "foo@foo.com",
#     nombre_cobro: "foo-bar-baz",
#     telefono_cobro: "473829",
#     email_cobro: "foo-charge@foo.com"
#   )

#   id += 1
# end



# Record.all.each do |record|
  # if record.client_id == nil
    # record.update(client_id: record.id-12822+3)
  # end

#   record.update(created_at: record.start_time)
# end


# Client.all.each do |client|
#   client.update(razon_social: client.id)
# end



# Service.all.each do |service|
#   service.update(created_at: service.fecha)
# end



# Receipt.delete_all
# Expense.delete_all

# Array(2019).each do |year|
#   Array(10..12).each do |month|
#     Array(1..28).each do |day|
#       Bus.all.each do |bus|
#         expense = Expense.create(
#           categoria: 'foo',
#           cantidad: 1.0,
#           nota: 'bar',
#           mes: month,
#           ano: year,
#           created_at: DateTime.new(year, month, day)
#         )

#         Receipt.create(
#           categoria: 'foo',
#           cantidad: 1.0,
#           nota: 'bar',
#           fecha: DateTime.new(year, month, day),
#           bus_id: bus.id,
#           expense_id: expense.id,
#           created_at: DateTime.new(year, month, day)
#         )
#       end
#     end
#   end
# end


# User.first(3).each { |user| user.update(company_id: co1.id) }
# User.last(2).each { |user| user.update(company_id: co2.id) }


# Quotation.all.each do |quotation|
#   quotation.update(user_id: [1,3,4,6].sample)
# end

# Record.all.each do |records|
#   records.update(user_id: [1,3,4,6].sample)
# end

# Service.all.each do |service|
#   service.update(user_id: [1,3,4,6].sample)
# end

# Bus.all.each do |bus|
#   bus.update(user_id: [1,3,4,6].sample)
# end

# Record.first(100).each do |record|
#   record.update(
#     start_time: '2020-04-03 01:00:00',
#     end_time: '2020-04-03 21:00:00'
#   )
# end

# Client.all.each do |client|
#   client.update(user_id: [1,3,4,6].sample)
# end

# Checkup.delete_all

# Bus.all.each do |bus|
#   # bus.update(
#   #   status: 'ok',
#   #   kms_servicio_preventivo: [10000,15000].sample,
#   #   kms_servicio_correctivo: [25000,35000].sample
#   # )

#   date = Faker::Date.between(from: 1.month.ago, to: 3.week.ago)

#   Checkup.create(
#     bus: bus,
#     category: 'preventivo',
#     fecha_inicio: date,
#     fecha_fin: date + 2.day
#   )

#   date = Faker::Date.between(from: 1.month.ago, to: 3.week.ago)

#   Checkup.create(
#     bus: bus,
#     category: 'correctivo',
#     fecha_inicio: date,
#     fecha_fin: date + 2.day
#   )
# end

# Service.all.each do |service|
#   service.update(
#     km_inicio: 0,
#     km_fin: Faker::Number.between(from: 500, to: 1000)
#   )
# end

Checkup.all.each do |checkup|
  date = Faker::Date.between(from: 5.month.ago, to: 3.week.ago)

  checkup.update(
    fecha_inicio: date,
    fecha_fin: date + 2.day
  )
end
