class CreateLocationStates < ActiveRecord::Migration[7.1]
  def change
    create_table :location_states, id: :uuid do |t|
      t.belongs_to :location_country, null: false, foreign_key: true, type: :uuid, index: true, comment: 'Country'
      t.string :name, null: false, comment: 'State name'
      t.string :abbreviation, null: false, comment: 'Local abbreviation'

      t.timestamps
    end
  end
end
