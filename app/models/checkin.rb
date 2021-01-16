class Checkin < ApplicationRecord
  belongs_to :place

  validates_presence_of :time_zone
  validate :time_zone_exists

  private

  def time_zone_exists
    return if time_zone? && ActiveSupport::TimeZone[time_zone].present?

    errors.add(:time_zone, 'does not exist')
  end
end
