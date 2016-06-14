json.array!(@clones) do |clone|
  json.extract! clone, :id, :person_id
  json.url clone_url(clone, format: :json)
end
