class EducationHistory < ApplicationRecord
  belongs_to :profile
  validates :school, presence: true
  validate :date_difference, if: ->{ !from.nil? and !to.nil? }

  private 

    def date_difference
      #debugger
      if from>=to
        errors.add(:base, 'form date must always be less than to date')
      end
    end
end
