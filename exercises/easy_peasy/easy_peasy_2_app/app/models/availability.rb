class Availability < ActiveRecord::Base
  validates :day_off, presence: true
end
