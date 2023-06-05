class Post < ApplicationRecord
  serialize :hourly_rate, Hash
  serialize :months, Array

  # validates :title, :months, :hourly_rate, :job_category, :experience_level, :description, presence: true
  # validates :title, length: { minimum: 2 }
  # validates :description, length: { minimum: 50 }

  belongs_to :user

  acts_as_taggable_on :skills
end
