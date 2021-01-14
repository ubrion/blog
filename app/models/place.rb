class Place < ApplicationRecord
  acts_as_mappable distance_field_name: :distance,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  validates :name, presence: true
end
