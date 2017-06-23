class User < ActiveRecord::Base
  has_one :profile
  has_many :availabilities

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  scope :with_accepted_profile, -> { joins(:profile).where.
    not(profiles: { accepted_at: nil }) }

  scope :with_day_off_in, ->(date) { joins(:availabilities).
    where(availabilities: { day_off: date } ) }

  scope :available_for_job, ->(job_date_range) { with_accepted_profile.
    where.not(id: User.users_with_day_off(job_date_range)) }

  def self.users_with_day_off(job_date_range)
    User.with_accepted_profile.with_day_off_in(job_date_range).map(&:id)
  end
end
