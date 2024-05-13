class Location::PostalCode < ApplicationRecord
  belongs_to :city, foreign_key: :location_city_id, class_name: 'Location::City'

  validates :postal_code, presence: true, uniqueness: { case_sensitive: false, scope: :location_city_id }
  normalizes :postal_code, with: ->(value) { value.strip }
end
