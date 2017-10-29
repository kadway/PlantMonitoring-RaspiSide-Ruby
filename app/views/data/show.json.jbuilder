#json.partial! "data/datum", datum: @datum
json.extract! @datum, :timestamp, :alias, :voltage, :percentage
