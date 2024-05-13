class CreateLocationCities < ActiveRecord::Migration[7.1]
  def change
    create_table :location_cities, id: :uuid do |t|
      t.belongs_to :location_state, null: false, foreign_key: true, type: :uuid, index: true
      t.belongs_to :location_district, foreign_key: true, type: :uuid, index: true, null: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
