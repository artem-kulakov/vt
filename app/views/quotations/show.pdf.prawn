logo = "#{Rails.root}/app/assets/images/tutto-05.png"
image logo, width: 120, position: :left

text "Fecha: #{@quotation.created_at.strftime(" %d-%b-%Y")}", :align => :right, :style => :italic
text "Número de cotización: 00#{@quotation.id}", :align => :right, :style => :italic
move_down 10

text " Atn: #{@quotation.nombre}"
move_down 10
text "#{@quotation.telefono}"


move_down 20
text "Buenas tarde, en respuesta a su solicitud le envío la siguiente cotización:", :size => 10, :align => :center

move_down 30

text "Fechas de servicio:    #{@quotation.fecha_inicio.strftime(" %d-%b-%Y")} -    #{@quotation.fecha_fin.strftime(" %d-%b-%Y")} ", :align => :left, size: 10, style: :bold
move_down 10 
text "Itinerario:"
@a= @quotation.places.map(&:address)
text "#{@a.join ', '}"
move_down 10 
text "Número de pasajeros:   #{@quotation.pasajeros} ", :align => :left, size: 10, style: :bold
move_down 10
stroke_horizontal_rule
move_down 10

data = [ ["","Irizar PB 47 plazas e 
	Irizar I6 51-53 plazas", "Irizar I6 47 plazas e 
	Irizar Century 53 plazas", "Volvo 9700
	44-47 plazas", "Sprinter 20 plazas"],
 ["", "$ #{@quotation.segmento1.round(2)} por unidad", "$ #{@quotation.segmento2.round(2)} por unidad", "$ #{@quotation.segmento3.round(2)} por unidad", "$ #{@quotation.segmento4.round(2)} por unidad"], 
 ["", "", "", "", ""],
 ["Día adicional", "$ #{@quotation.dia_extra1.round(2)}", "$ #{@quotation.dia_extra2.round(2)}", "$ #{@quotation.dia_extra3.round(2)}", "$ #{@quotation.dia_extra4.round(2)}"]
 ]

table data, :position => :center, :width => 520, :row_colors => ["FFFFFF", "E6E6E6"], :cell_style => { :font => "Helvetica", :size => 11 }


move_down 30

text "Condiciones de pago: 30% reservación, 70% dos días antes del servicio", :align => :center, :size => 10
text "Precios más I.V.A", :align => :center, :size => 10

move_down 20

text "Observaciones: ", :align => :left, :style => :bold 
text"#{@quotation.observaciones}", :size => 10





bounding_box [bounds.left, bounds.bottom + 120], :width  => bounds.width do
				text "#{@quotation.user.name}", :align => :left, :size => 12
				text "#{@quotation.user.puesto}", :align => :left, :size => 12
				text "57540445 | 57528619 | 57540026", :align => :left, :size => 10
				text "#{@quotation.user.phone}", :align => :left, :size => 10
				move_down 50
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end
