class Job < ActiveRecord::Base
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def available_users
    job_date_range = start_date..end_date
    User.available_for_job(job_date_range)
  end
end