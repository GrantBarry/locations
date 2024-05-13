class Location::District < ApplicationRecord
  belongs_to :state, class_name: 'Location::State', foreign_key: :location_state_id
  has_many :cities, class_name: 'Location::City', foreign_key: :location_district_id, dependent: :delete_all

  has_many :postal_codes, through: :cities

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :location_state_id }
  normalizes :name, with: ->(value) { value.strip }
end
