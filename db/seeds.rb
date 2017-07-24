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
a05= User.create!({:email => "alma@tuttoilmondo.com", :password => "tuttoilmondo", :password_confirmation => "tuttoilmondo", :admin => false, :name => "Alma", :puesto => "Directora Administrativa", :phone => "" })

b01= Bus.create!({:numero => "11", :marca => "SPRINTER", :capacidad => "19", :modelo => "2013", :placa => "732RP3", :version => "SPRINTER" })
b02= Bus.create!({:numero => "12", :marca => "SPRINTER", :capacidad => "19", :modelo => "2013", :placa => "731RP3", :version => "SPRINTER" })
b03= Bus.create!({:numero => "22", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "327RP4", :version => "IRIZAR I6" })
b04= Bus.create!({:numero => "24", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "060RP7", :version => "IRIZAR I6" })
b05= Bus.create!({:numero => "26", :marca => "SCANIA", :capacidad => "47", :modelo => "2014", :placa => "329RP7", :version => "IRIZAR I6" })
b06= Bus.create!({:numero => "27", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "702RN9", :version => "IRIZAR I6" })
b07= Bus.create!({:numero => "28", :marca => "VOLVO", :capacidad => "44", :modelo => "2008", :placa => "755RL7", :version => "VOLVO 9700" })
b08= Bus.create!({:numero => "29", :marca => "VOLVO", :capacidad => "47", :modelo => "2007", :placa => "701RL7", :version => "VOLVO 9700" })
b09= Bus.create!({:numero => "30", :marca => "SCANIA", :capacidad => "47", :modelo => "2015", :placa => "059RP7", :version => "IRIZAR I6" })
b10= Bus.create!({:numero => "31", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "677RP9", :version => "IRIZAR I6" })
b11= Bus.create!({:numero => "32", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "676RP9", :version => "IRIZAR I6" })
b12= Bus.create!({:numero => "33", :marca => "SCANIA", :capacidad => "51", :modelo => "2016", :placa => "604RR1", :version => "IRIZAR I6" })
b13= Bus.create!({:numero => "35", :marca => "SCANIA", :capacidad => "47", :modelo => "2015", :placa => "195RR4", :version => "IRIZAR PB" })
b14= Bus.create!({:numero => "37", :marca => "SCANIA", :capacidad => "53", :modelo => "2007", :placa => "269RJ6", :version => "IRIZAR" })
b15= Bus.create!({:numero => "38", :marca => "SCANIA", :capacidad => "53", :modelo => "2007", :placa => "270RJ6", :version => "IRIZAR" })
b16= Bus.create!({:numero => "39", :marca => "SCANIA", :capacidad => "47", :modelo => "2012", :placa => "799RN1", :version => "IRIZAR PB" })
b17= Bus.create!({:numero => "42", :marca => "SCANIA", :capacidad => "53", :modelo => "2008", :placa => "669RL7", :version => "IRIZAR" })
b18= Bus.create!({:numero => "43", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "868RN1", :version => "IRIZAR PB" })
b19= Bus.create!({:numero => "44", :marca => "SCANIA", :capacidad => "47", :modelo => "2013", :placa => "869RN1", :version => "IRIZAR PB" })
b20= Bus.create!({:numero => "45", :marca => "SCANIA", :capacidad => "49", :modelo => "2013", :placa => "870RN1", :version => "IRIZAR PB" })
b21= Bus.create!({:numero => "46", :marca => "SCANIA", :capacidad => "53", :modelo => "2016", :placa => "612RR1", :version => "IRIZAR PB" })
