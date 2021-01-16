class CreateCheckins < ActiveRecord::Migration[6.1]
  def change
    create_table :checkins do |t|
      t.references :place, null: false, foreign_key: true
      t.text :notes
      t.datetime :datetime

      t.timestamps
    end
  end
end
