class Location::State < ApplicationRecord
  belongs_to :country, class_name: 'Location::Country', foreign_key: :location_country_id

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :location_country_id }
  normalizes :name, with: ->(value) { value.strip }

  normalizes :abbreviation, with: ->(value) { value.strip }

  has_many :cities, dependent: :delete_all, class_name: 'Location::City', foreign_key: :location_state_id
  has_many :districts, dependent: :delete_all, class_name: 'Location::District', foreign_key: :location_state_id
end
