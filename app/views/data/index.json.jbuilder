json.array!(@data) do |Datum|
  json.extract! datum, :id
  json.url datum_url(datum, format: :json)
end

#json.array! @data, partial: 'data/datum', as: :datum

#json.array!(@parks) do |park|
#  json.extract! park, :id
#  json.url park_url(park, format: :json)
#end
