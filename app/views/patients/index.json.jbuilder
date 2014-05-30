json.array!(@patients) do |patient|
  json.extract! patient, :id, :first_name, :middle_name, :last_name, :description
  json.url patient_url(patient, format: :json)
end
