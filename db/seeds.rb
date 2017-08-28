# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


a01= User.create!({:email => "gonzalo@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => true, :name => "Gonzalo Jimenez", :puesto => "Director General", :phone => "" })
a02= User.create!({:email => "comercial@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Iván del Toro", :puesto => "Director Comercial", :phone => "55 2981 3313" })
a03= User.create!({:email => "operaciones@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Octavio Aridjis", :puesto => "Director de Operaciones", :phone => "" })
a04= User.create!({:email => "ventas@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Estefany Rodríguez", :puesto => "Ejecutivo de Venta", :phone => "55 2803 7565" })
a05= User.create!({:email => "administracion@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Alma", :puesto => "Directora Administrativa", :phone => "" })


o01= Operator.create!({ :nombre => "Jorge Amador"})
o02= Operator.create!({ :nombre => "Gerardo Ramirez"})
o03= Operator.create!({ :nombre => "Eleazar Villar"})
o04= Operator.create!({ :nombre => "Sergio Maquez"})
o05= Operator.create!({ :nombre => "Pablo Salinas"})
o06= Operator.create!({ :nombre => "Oscar Ferrer"})
o07= Operator.create!({ :nombre => "Jose C. Hernandez"})
o08= Operator.create!({ :nombre => "Salvador Trejo"})
o09= Operator.create!({ :nombre => "Maximino Guerrero"})
o10= Operator.create!({ :nombre => "Jose M. Nuñez"})
o11= Operator.create!({ :nombre => "Mario Perea"})
o12= Operator.create!({ :nombre => "Francisco Mayen"})
o13= Operator.create!({ :nombre => "Ernesto Jimenez"})
o14= Operator.create!({ :nombre => "Carlos Tellez"})
o15= Operator.create!({ :nombre => "Francisco Jimenez"})
o16= Operator.create!({ :nombre => "Juan P. Martinez"})
o17= Operator.create!({ :nombre => "Alejandro Salgado"})
o18= Operator.create!({ :nombre => "Miaguel A. Sanchez"})
o19= Operator.create!({ :nombre => "Erick Mendoza"})
o20= Operator.create!({ :nombre => "Marco A. Rodriguez"})
o21= Operator.create!({ :nombre => "Antonio Sanchez"})



b01= Bus.create!({:numero => "11", :marca => "SPRINTER", :capacidad => "19", :modelo => "2013", :placa => "732RP3", :version => "SPRINTER", :operator_id =>1 })
b02= Bus.create!({:numero => "12", :marca => "SPRINTER", :capacidad => "19", :modelo => "2013", :placa => "731RP3", :version => "SPRINTER", :operator_id =>2 })
b03= Bus.create!({:numero => "22", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "327RP4", :version => "IRIZAR I6", :operator_id =>3 })
b04= Bus.create!({:numero => "24", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "060RP7", :version => "IRIZAR I6", :operator_id =>4 })
b05= Bus.create!({:numero => "26", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "329RP7", :version => "IRIZAR I6", :operator_id =>5 })
b06= Bus.create!({:numero => "27", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "702RN9", :version => "IRIZAR I6", :operator_id =>6 })
b07= Bus.create!({:numero => "28", :marca => "VOLVO", :capacidad => "44", :modelo => "2008", :placa => "755RL7", :version => "VOLVO 9700", :operator_id =>7 })
b08= Bus.create!({:numero => "29", :marca => "VOLVO", :capacidad => "47", :modelo => "2007", :placa => "701RL7", :version => "VOLVO 9700", :operator_id =>8 })
b09= Bus.create!({:numero => "30", :marca => "SCANIA", :capacidad => "47", :modelo => "2015", :placa => "059RP7", :version => "IRIZAR I6", :operator_id =>9 })
b10= Bus.create!({:numero => "31", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "677RP9", :version => "IRIZAR I6", :operator_id =>10 })
b11= Bus.create!({:numero => "32", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "676RP9", :version => "IRIZAR I6", :operator_id =>11 })
b12= Bus.create!({:numero => "33", :marca => "SCANIA", :capacidad => "51", :modelo => "2016", :placa => "604RR1", :version => "IRIZAR I6", :operator_id =>12 })
b13= Bus.create!({:numero => "35", :marca => "SCANIA", :capacidad => "47", :modelo => "2015", :placa => "195RR4", :version => "IRIZAR PB", :operator_id =>13 })
b14= Bus.create!({:numero => "37", :marca => "SCANIA", :capacidad => "53", :modelo => "2007", :placa => "269RJ6", :version => "IRIZAR", :operator_id =>14 })
b15= Bus.create!({:numero => "38", :marca => "SCANIA", :capacidad => "53", :modelo => "2007", :placa => "270RJ6", :version => "IRIZAR", :operator_id =>15 })
b16= Bus.create!({:numero => "39", :marca => "SCANIA", :capacidad => "47", :modelo => "2012", :placa => "799RN1", :version => "IRIZAR PB", :operator_id =>16 })
b41= Bus.create!({:numero => "41", :marca => "SCANIA", :capacidad => "53", :modelo => "2008", :placa => "670RL7", :version => "IRIZAR R", :operator_id =>17 })
# b17= Bus.create!({:numero => "42", :marca => "SCANIA", :capacidad => "53", :modelo => "2008", :placa => "669RL7", :version => "IRIZAR", :operator_id =>18 })
b17= Bus.create!({:numero => "43", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "868RN1", :version => "IRIZAR PB", :operator_id =>18 })
b18= Bus.create!({:numero => "44", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "869RN1", :version => "IRIZAR PB", :operator_id =>19 })
b19= Bus.create!({:numero => "45", :marca => "SCANIA", :capacidad => "49", :modelo => "2013", :placa => "870RN1", :version => "IRIZAR PB", :operator_id =>20 })
b20= Bus.create!({:numero => "46", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "612RR1", :version => "IRIZAR PB", :operator_id =>21 })
