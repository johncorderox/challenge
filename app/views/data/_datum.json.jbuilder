json.extract! datum, :id, :day, :max, :min, :created_at, :updated_at
json.url datum_url(datum, format: :json)
