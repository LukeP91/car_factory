class User < ActiveRecord::Base
  has_one :profile
  has_many :availabilities

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end