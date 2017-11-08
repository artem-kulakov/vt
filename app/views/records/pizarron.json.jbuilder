(@records).map do |record|
  json.array!record.services do |service|
    json.extract! service, :id
    json.title record.title
    json.start (record.start_time.strftime(" %Y-%m-%d"))
    @end_time = record.end_time+100000
    json.end (@end_time.strftime(" %Y-%m-%d"))
    json.url record_url(record, format: :html)
    json.resourceId service.resourceId
    json.color record.color
  end
end

