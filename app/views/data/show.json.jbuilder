#json.partial! "data/datum", datum: @datum
json.extract! @datum, :timestamp, :alias, :voltage, :percentage

json.array!(@data) do |Datum|
  json.extract! datum, :id
  json.url datum_url(datum, format: :json)
end