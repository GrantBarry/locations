class Location::City < ApplicationRecord
  belongs_to :state, class_name: 'Location::State', foreign_key: :location_state_id
  belongs_to :district, class_name: 'Location::District', foreign_key: :location_district_id, optional: true

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :location_state_id }
  normalizes :name, with: ->(value) { value.strip }

  normalizes :description, :keywords, with: ->(attribute) { attribute.strip.downcase }

  validates :slug, presence: true, uniqueness: true

  has_many :postal_codes, class_name: 'Location::PostalCode', dependent: :delete_all, foreign_key: :location_city_id
end
