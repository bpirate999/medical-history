json.array!(@writings) do |writing|
  json.extract! writing, :id, :diagnosis, :treatment, :patient_id
  json.url writing_url(writing, format: :json)
end
