class Experience < ApplicationRecord
  belongs_to :profile

  validates :company, :title, :country, presence: true
  validate :date_difference, if: ->{ !start_date.nil? and !end_date.nil? }

  private 

    def date_difference
      if start_date>=end_date
        errors.add(:base, 'start date must always be less than end date')
      end
    end
end
