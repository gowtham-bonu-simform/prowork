class EducationHistory < ApplicationRecord
  belongs_to :profile
  validates :school, presence: true
end
