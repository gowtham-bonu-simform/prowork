class EducationHistory < ApplicationRecord
  belongs_to :profile
  validates :school, presence: true
  validates :from, comparison: {less_than: :to}
end
