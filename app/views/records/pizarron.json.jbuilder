colors = [
  '#FED56F',
  '#A1EC90',
  '#78E0FF'
]

(@records).map do |record|
  json.array!record.services do |service|
    json.extract! service, :id
    json.title record.title
    json.start (record.start_time.strftime(" %Y-%m-%d"))
    @end_time = record.end_time+100000
    json.end (@end_time.strftime(" %Y-%m-%d"))
    json.url record_path(record, format: :html)
    json.resourceId service.resourceId
    json.color colors.sample
  end
end

json.array!@checkups do |checkup|
  json.title ('checkup')
  json.start (checkup[:start_time].strftime(" %Y-%m-%d"))
  json.end (checkup[:end_time].strftime(" %Y-%m-%d"))
  json.url bus_url(checkup[:bus_id], format: :html)
  json.resourceId checkup[:bus_id]
  json.color "#FE6F9A"
end
