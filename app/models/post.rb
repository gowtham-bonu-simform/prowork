class Post < ApplicationRecord
  @@error_msg = "minimum value can't be equal to or greater than maximum value"

  validates :title, :months, :hourly_rate, :experience, :description, presence: true
  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 50 }
  validate :months_span
  validate :rate_span

  belongs_to :user

  acts_as_taggable_on :skills

  private

    def months_span
      if months[0] >= months[1]
        errors.add(:months, @@error_msg)
      end
    end

    def rate_span
      if hourly_rate[0] >= hourly_rate[1]
        errors.add(:hourly_rate, @@error_msg)
      end
    end
end