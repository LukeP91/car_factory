class Availability < ActiveRecord::Base
  belongs_to :user

  validates :day_off, presence: true
end
