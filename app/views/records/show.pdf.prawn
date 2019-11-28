@services.each_with_index do |service, index| 

#PRimera página
text "#{index + 1} - 1/8", size: 8, style: :bold

text "TUTTO IL MONDO, S.A. de C.V", :align => :center, size: 12, style: :bold
move_down 10
text "CONTRATO-ORDEN DE SERVICIO", :align => :center, size: 10, style: :bold
move_down 20
stroke_horizontal_rule
move_down 10 
text "Folio:  00#{service.id}", align: :right
text "Creado por:  #{service.record.user.name}", align: :right, size: 9
text "Precio Unitario:    #{service.precio_unidad}", align: :left
move_down 3
text "Fecha de Salida:    #{service.record.start_time.strftime(" %b-%d-%Y")}", align: :left
move_down 3
text "Fecha de Regreso:    #{service.record.end_time.strftime(" %b-%d-%Y")}", align: :left
move_down 3
text "Cliente:    #{service.record.client.razon_social}", align: :left
move_down 10
stroke_horizontal_rule
move_down 10 
text "Nombre de contacto:    #{service.record.nombre_referencia}", align: :left
text "Teléfono de contacto:    #{service.record.telefono_referencia}", align: :left
move_down 10
stroke_horizontal_rule
move_down 10 
text "Autobús:    #{service.bus.numero}", align: :left
text "Pasajeros:    #{service.record.numero_pasajeros}", align: :left
move_down 10
stroke_horizontal_rule
move_down 10 
text "Operador:   #{service.bus.operator.nombre}", align: :left

move_down 20
text "Hora de Cita:    #{service.record.initial_time}", align: :left
text "Hora de Regreso:    #{service.record.finish_time}", align: :left


move_down 10
stroke_horizontal_rule
move_down 10 
text "Dirección de la Cita:    #{service.record.lugar_salida}", align: :left
text "Referencia de la Cita:    #{service.record.referencia_salida}", align: :left

move_down 10
stroke_horizontal_rule
move_down 10 
text "Itinerario:"
@a= service.record.routes.map(&:place)
text "#{@a.join ', '}"

move_down 10
stroke_horizontal_rule
move_down 10 
text "Observaciones: ", :align => :left, :style => :bold 
text"#{service.record.observaciones}", :size => 10

bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end

    start_new_page

text "#{index + 1} - 2/8", size: 8, style: :bold

move_down 20
stroke_horizontal_rule
move_down 20 


data = [ ["", "Entregado", "Comprobado"], ["Casetas efectivo:", " #{service.caseta}", " "], ["Hotel:", " #{service.hotel}", " "], ["Viáticos:", " #{service.viaticos}", " "], ["Estacionamiento:", " #{service.estacionamientos}", " "], ["Lavadas:", " #{service.lavadas}", " "], ["Aeropuerto:", " #{service.aeropuerto}", " "], ["Otros", " #{service.otros}", " "], ["Diesel", " #{service.diesel}", " "], ["", " ", " "], ["Total:", " #{service.sum_gastos}", " "]
 ]

table data, :position => :center, :width => 520, :row_colors => ["FFFFFF", "d0d0d0"], :cell_style => { :font => "Helvetica", :size => 11 }
move_down 15



bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end


    start_new_page

# Segunda pagina 
text "#{index + 1} - 3/8", size: 8, style: :bold

text "TUTTO IL MONDO, S.A. de C.V", :align => :center, size: 12, style: :bold
move_down 10
text "CONTRATO-ORDEN DE SERVICIO", :align => :center, size: 10, style: :bold
move_down 20
stroke_horizontal_rule
move_down 20 

text "Folio:  00#{service.id}", align: :right
text "Creado por:  #{service.record.user.name}", align: :right, size: 9
move_down 10
text "Km inicial___________", align: :left
move_down 5
text "Km final_____________", align: :left
move_down 5
text "Fecha de Salida:    #{service.record.start_time.strftime(" %b-%d-%Y")}", align: :left
move_down 15

stroke_horizontal_rule
move_down 10
text "Cliente:     #{service.record.client.razon_social}" 
text "Contacto:    #{service.record.nombre_referencia}", align: :left
text "Teléfono de contacto:    #{service.record.telefono_referencia}", align: :left
move_down 30
stroke_horizontal_rule
move_down 10 
text "Autobús:    #{service.bus.numero}", align: :left
text "Pasajeros:    #{service.record.numero_pasajeros}", align: :left
move_down 30
stroke_horizontal_rule
move_down 10 
text "Operador:   #{service.bus.operator.nombre}", align: :left

move_down 20
text "Hora de Cita:    #{service.record.initial_time}", align: :left


move_down 30
stroke_horizontal_rule
move_down 10 
text "Dirección de la Cita:    #{service.record.lugar_salida}", align: :left
text "Referencia de la Cita:    #{service.record.referencia_salida}", align: :left

move_down 30
stroke_horizontal_rule
move_down 10 
text "Itinerario:"
@a= service.record.routes.map(&:place)
text "#{@a.join ', '}"
move_down 5
text "Fecha de Regreso:    #{service.record.end_time.strftime(" %b-%d-%Y")}", align: :left
move_down 30
stroke_horizontal_rule
move_down 10 
text "Observaciones: ", :align => :left, :style => :bold 
text"#{service.record.observaciones}", :size => 10

bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end

start_new_page

#tercera página
text "#{index + 1} - 4/8", size: 8, style: :bold

text "TUTTO IL MONDO, S.A. de C.V", :align => :center, size: 12, style: :bold
move_down 10
text "RELACIÓN DE GASTOS POR COMPROBAR", :align => :center, size: 10, style: :bold
move_down 20
stroke_horizontal_rule
move_down 20 

text "Autobús:    #{service.bus.numero}", align: :left

move_down 10 
 text "Operador:   #{service.bus.operator.nombre}", align: :left


move_down 10

data = [ ["", "Entregado", "Comprobado"], ["Casetas efectivo:", " #{service.caseta}", " "], ["Hotel:", " #{service.hotel}", " "], ["Viáticos:", " #{service.viaticos}", " "], ["Estacionamiento:", " #{service.estacionamientos}", " "], ["Lavadas:", " #{service.lavadas}", " "], ["Aeropuerto:", " #{service.aeropuerto}", " "], ["Otros", " #{service.otros}", " "], ["Diesel", " #{service.diesel}", " "], ["", " ", " "], ["Total:", " #{service.sum_gastos}", " "]
 ]

table data, :position => :center, :width => 520, :row_colors => ["FFFFFF", "d0d0d0"], :cell_style => { :font => "Helvetica", :size => 11 }
move_down 15



bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end

start_new_page

#cuarta página
text "#{index + 1} - 5/8", size: 8, style: :bold

text "TUTTO IL MONDO, S.A. de C.V", :align => :center, size: 12, style: :bold
move_down 10
text "CONTRATO DE PRESTACIÓN DE SERVICIO DE TRANSPORTE", :align => :center, size: 10, style: :bold
text "Tutto il mondo, S. A. de C. V. Av. Las Americas 608 int 105, Col. La Fuente, Aguascalientes, Ags., C P 20239", :align => :center, size: 8
text "RFC: TIM 000215 TQ1", :align => :center, size: 8
move_down 20
stroke_horizontal_rule
move_down 20 

text "Fecha: #{service.created_at.strftime(" %d-%b-%Y")}", :align => :right, :style => :italic, size: 10
move_down 10
stroke_horizontal_rule
move_down 5
text "Información del cliente", align: :center, style: :bold, size: 10
stroke_horizontal_rule
move_down 8
text "Cliente:    #{service.record.client.razon_social}", align: :left
text "Contacto:    #{service.record.title}", align: :left
text "Nombre de contacto:    #{service.record.nombre_referencia}", align: :left
text "Teléfono de contacto:    #{service.record.telefono_referencia}", align: :left
move_down 8
stroke_horizontal_rule
move_down 5
text "Descripción del Servicio", align: :center, style: :bold, size: 10
stroke_horizontal_rule
move_down 8


text "Dirección de la Cita:    #{service.record.lugar_salida}", align: :left
text "Referencia de la Cita:    #{service.record.referencia_salida}", align: :left

move_down 8
text "Itinerario:"
@a= service.record.routes.map(&:place)
text "#{@a.join ', '}"

text "Fecha de Salida:    #{service.record.start_time.strftime(" %b-%d-%Y")}", align: :left
text "Fecha de Regreso:    #{service.record.end_time.strftime(" %b-%d-%Y")}", align: :left
text "Hora de Cita:    #{service.record.initial_time}", align: :left
move_down  8

stroke_horizontal_rule
move_down 5
text "Información de la unidad", align: :center, style: :bold, size: 10
stroke_horizontal_rule
move_down 8

text "Autobús:    #{service.bus.numero} #{service.bus.marca}", align: :left
text "Pasajeros:    #{service.record.numero_pasajeros}", align: :left


move_down  8

stroke_horizontal_rule
move_down 5
text "Características del Contrato", align: :center, style: :bold, size: 10
stroke_horizontal_rule
move_down 8

text "Tarifa por unidad:    #{service.precio_unidad}", align: :left
text "Tarifa adicional por día:    #{service.dia_extra}", align: :left
text "Precio sin I.V.A:    #{service.record.precio}", align: :left
text "Precio con I.V.A:    #{service.record.precio_final}", align: :left, style: :bold

move_down 30
stroke_horizontal_rule
move_down 4
text "SELLOS DIGITALES: 9Mx5o8pDH3FbiYK++IJZwCddlyvnjM7iRtE7a7bdT8P1QHoZoIDqZj3ETqEC4kkBAjj--", align: :center, size: 8
stroke_horizontal_rule
move_down 10

text "Observaciones: ", :align => :left, :style => :bold 
text"#{service.record.observaciones}", :size => 10
move_down 30
text "Tutto il Mondo S.A. de C.V.                                                                    Acepto Términos y Condiciones"
bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end

start_new_page


#5a página
text "#{index+1} - 6/8", size: 8, style: :bold

text "TUTTO IL MONDO, S.A. de C.V", :align => :center, size: 12, style: :bold
move_down 10
text "BITÁCORA DE HORAS DE SERVICIO DEL CONDUCTOR", :align => :center, size: 10, style: :bold
text "Tutto il mondo, S. A. de C. V. Av. Las Americas 506-C, Col. La Fuente, Aguascalientes, Ags., C P 20230", :align => :center, size: 8
text "RFC: TIM 000215 TQ1", :align => :center, size: 8
move_down 20
stroke_horizontal_rule
move_down 20 

text "Fecha: #{service.created_at.strftime(" %d-%b-%Y")}", :align => :right, :style => :italic, size: 10
move_down 10

text "Operador:   #{service.bus.operator.nombre}", align: :left
text "Número de Licencia: #{service.bus.operator.licencia}", align: :left, style: :bold
text "Vigencia de licencia: #{service.bus.operator.validez}", align: :left, style: :bold

move_down 10

text "Autobús:    #{service.bus.numero} #{service.bus.marca}", align: :left
text "Modelo:    #{service.bus.modelo},     Placas:    #{service.bus.placa},     Marca:    #{service.bus.marca},     Modelo:    #{service.bus.modelo}", align: :left

move_down 10
text "Cliente:   #{service.record.client.razon_social}", align: :left
move_down 10
stroke_horizontal_rule
move_down 10
text "Origen: #{service.record.routes[0].place}              Destino: #{service.record.routes.last.place}"
move_down 10 
text "Itinerario:", style: :bold
@a= service.record.routes.map(&:place)
text "#{@a.join ', '}"

move_down 15
stroke_horizontal_rule
move_down 5
text "CASOS DE EXCEPCIÓN EN LOS QUE EL CONDUCTOR PUEDA EXCEDERSE DE LA JORNADA", align: :center, style: :bold, size: 10
stroke_horizontal_rule
move_down 10
text "EN CIERRE DE CARRETERAS Y VIALIDADES POR PROBLEMAS DE TRAFICO, BLOQUEOS Y/O ACCIDENTES Y", align: :center, size: 8
text "HASTA QUE LA UNIDAD Y PASAJEROS SE ENCUENTREN EN UN LUGAR SEGURO PARA EL DESCANSO DE LOS", align: :center, size: 8
text "MISMOS Y EL OPERADOR O FIN DEL SERVICIO.", align: :center, size: 8
text "DESCOMPOSTURAS Y AVERIAS DE LA UNIDAD Y HASTA QUE LA UNIDAD Y PASAJEROS SE ENCUENTREN", align: :center, size: 8
text "EN UN LUGAR SEGURO PARA DESCANSO DE LOS MISMO Y DEL OPERADOR O FIN DE SERVICIO.", align: :center, size: 8

move_down 15
stroke_horizontal_rule
move_down 5
text "BITACORA DEL CONDUCTOR", align: :center, style: :bold, size: 10
stroke_horizontal_rule
move_down 10

data = [ ["Fecha:", " ", " ", " ", " ", " ", " ", " "], ["Inicio:", " ", " ", " ", " ", " ", " ", " "], ["Llegada:", " ", " ", " ", " ", " ", " ", " "], ["Conducción:", " ", " ", " ", " ", " ", " ", " "], ["Paradas NO programadas:", " ", " ", " ", " ", " ", " ", " "], ["Fuera de Servicio:", " ", " ", " ", " ", " ", " ", " "], ["Descanso:", " ", " ", " ", " ", " ", " ", " "], ["", " ", " ", " ", " ", " ", " ", " "], ["Total:", " ", " ", " ", " ", " ", " ", " "]
 ]

table data, :position => :center, :width => 520, :row_colors => ["FFFFFF", "d0d0d0"], :cell_style => { :font => "Helvetica", :size => 11 }
move_down 15

text "Permisionario", align: :left
text "Conductor", align: :right

bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end

start_new_page

#inicio 6a
text "#{index+1} - 7/8", size: 8, style: :bold

text "TUTTO IL MONDO, S.A. de C.V", :align => :center, size: 12, style: :bold
move_down 10
text "REPORTE DE CONDICIONES DE OPERACIÓN / SOLICITUD DE MANTENIMIENTO", :align => :center, size: 10, style: :bold
move_down 10
stroke_horizontal_rule
move_down 10 

text "Fecha: #{service.created_at.strftime(" %d-%b-%Y")}", :align => :right, :style => :italic, size: 10
move_down 10

text "Operador:   #{service.bus.operator.nombre}", align: :left
text "Autobús:    #{service.bus.numero} #{service.bus.marca}", align: :left

move_down 10
text "Itinerario:"
@a= service.record.routes.map(&:place)
text "#{@a.join ', '}"
move_down 5

text "Temperatura: ________________________        Presión Aceite: ________________________", align: :left
text "Carga Alternadores: __________________         Presión Aire: _________________________", align: :left
text "Nivel Aceite: ________________________         Nivel Anticongelante: _____________________", align: :left
move_down 15

text "OBSERVACIONES / INCIDENCIA DEL SERVICIO:", style: :bold, size: 10
move_down 5
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule

move_down 15



text "MOTOR:", style: :bold, size: 10
move_down 5
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 15

text "ELÉCTRICO:", style: :bold, size: 10
move_down 5
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 15

text "SUSPENSIÓN / TRANSMISIÓN / FRENOS / DIRECCIÓN:", style: :bold, size: 10
move_down 5
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 15

text "AUDIO / VIDEO:", style: :bold, size: 10
move_down 5
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 15

text "CARROCERÍA / IMAGEN:", style: :bold, size: 10
move_down 5
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 15

text "AIRE ACONDICIONADO:", style: :bold, size: 10
move_down 5
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 12
stroke_horizontal_rule
move_down 15



bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end

start_new_page
#7a página
text "#{index+1} - 8/8", size: 8, style: :bold
text "TUTTO IL MONDO, S.A. de C.V", :align => :center, size: 12, style: :bold
move_down 10
text "ENCUESTA DE SATIFACCION DEL CLIENTE", :align => :center, size: 10, style: :bold
text "PARA DARLE EL MEJOR SERVICIO SU OPINION ES IMPORTANTE", :align => :center, size: 10, style: :bold
text "Tutto il mondo, S. A. de C. V. Av. Las Americas 506-C, Col. La Fuente, Aguascalientes, Ags., C P 20230", :align => :center, size: 8
text "RFC: TIM 000215 TQ1", :align => :center, size: 8
move_down 20
stroke_horizontal_rule
move_down 20 

text "Fecha: #{service.record.end_time.strftime(" %d-%b-%Y")}", :align => :right, :style => :italic, size: 10
move_down 10
text "Cliente:   #{service.record.client.razon_social}", align: :left
# text "Segmento de Cliente:   #{service.try(:segment)}", align: :left
text "Itinerario:", style: :bold
@a= service.record.routes.map(&:place)
text "#{@a.join ', '}"
text "Operador:   #{service.bus.operator.nombre}", align: :left, style: :bold
text "Autobús:    #{service.bus.numero} #{service.bus.marca}", align: :left
move_down 10
stroke_horizontal_rule
move_down 20 

move_down 20
data = [ ["", "Satisfecho", "Insatisfecho"],["Fechas", "", ""],["Atención al solicitar el servicio", "", ""],["Puntualidad de la unidad", "", ""],["Limpieza de la unidad", "", ""],["Audio/video y micrófono", "", ""],["Aire acondicionado/calefacción", "", ""],["Presentación del Operador", "", ""],["Actitud del operador", "", ""],["", "Sí", "No"],["Volvería a contratar con nosotros", "", ""]
 ]

table data, :position => :center, :width => 520, :row_colors => ["FFFFFF", "d0d0d0"], :cell_style => { :font => "Helvetica", :size => 11 }
move_down 15
text "Requiere que nos comuniquemos con usted?. A qué número?", align: :left
move_down 5
text "Teléfono:__________________________", align: :left
move_down 10

text "Observaciones:", align: :left, style: :bold
move_down 30

text "Firma de confirmidad con el servicio. Y QUIEN REVISA QUE NO HAYA NADA OLVIDADO EN LA UNIDAD", align: :left, style: :bold
move_down 10
text "____________________________", align: :left, style: :bold
bounding_box [bounds.left, bounds.bottom + 25], :width  => bounds.width do
        font "Helvetica"
        stroke_horizontal_rule
        move_down(5)
        text "Neptuno 9C, Col. Nueva Industrial Vallejo, Del. Gustavo A. Madero, Cd MX   -   www.tuttoilmondo.com", :size => 11, :align => :center
    end

end

