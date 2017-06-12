class Job < ActiveRecord::Base
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def available_users
    job_date_range = start_date..end_date
    users_with_day_off = User.with_accepted_profile.
      with_day_off_in(job_date_range).map(&:id)
    User.with_accepted_profile.where.not(id: users_with_day_off)
  end
end