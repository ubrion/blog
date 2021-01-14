class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.decimal :latitude, { precision: 10, scale: 6 }
      t.decimal :longitude, { precision: 10, scale: 6 }
      t.text :notes

      t.timestamps
    end
  end
end
