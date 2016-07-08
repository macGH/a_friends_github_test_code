json.array!(@aws) do |aw|
  json.extract! aw, :id, :file
  json.url aw_url(aw, format: :json)
end
