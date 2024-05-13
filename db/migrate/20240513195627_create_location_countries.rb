class CreateLocationCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :location_countries, id: :uuid do |t|
      t.string :name, null: false, comment: 'Country name'
      t.string :code, null: false, comment: 'ISO 3166-1 alpha-2 code'

      t.timestamps
    end
  end
end
