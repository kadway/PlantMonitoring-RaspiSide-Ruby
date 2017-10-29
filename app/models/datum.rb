class Datum < ApplicationRecord
  validates :timestamp, :alias, :voltage, :percent, presence: true
end
