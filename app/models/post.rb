class Post < ApplicationRecord
  validates :title, :skill, :months, :hourly_rate, :job_category, :experience_level, :description, presence: true
  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 50 }

  belongs_to :user
end
