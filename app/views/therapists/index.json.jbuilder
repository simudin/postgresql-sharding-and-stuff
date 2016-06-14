json.array!(@therapists) do |therapist|
  json.extract! therapist, :id, :name, :clone_id
  json.url therapist_url(therapist, format: :json)
end
