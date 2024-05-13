class CreateLocationPostalCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :location_postal_codes, id: :uuid do |t|
      t.belongs_to :location_city, null: false, foreign_key: true, type: :uuid, index: true
      t.string :postal_code

      t.timestamps
    end
  end
end
