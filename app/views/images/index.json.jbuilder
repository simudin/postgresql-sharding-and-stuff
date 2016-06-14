json.array!(@images) do |image|
  json.extract! image, :id, :person_id, :partition_id, :url
  json.url image_url(image, format: :json)
end
