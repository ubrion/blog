class AddCoordinatesToCheckin < ActiveRecord::Migration[6.1]
  def change
    add_column :checkins, :latitude, :decimal, { precision: 10, scale: 6 }
    add_column :checkins, :longitude, :decimal, { precision: 10, scale: 6 }
  end
end
