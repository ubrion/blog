class AddTimeZoneToCheckin < ActiveRecord::Migration[6.1]
  def change
    add_column :checkins, :time_zone, :string, default: 'UTC'
  end
end
