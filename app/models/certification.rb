class Certification < ApplicationRecord
  belongs_to :profile

  validates :issue_date, presence: true
  validate :valid_url
  validate :date_difference, if: ->{ !issue_date.nil? and !expiration_date.nil? }

  private

    def valid_url
      unless certification_url.starts_with? 'https://' and certification_url.ends_with? '.com'
        errors.add(:certification_url, 'must be a valid url, for example: https://sampler.com')
      end
    end

    def date_difference
      if issue_date>=expiration_date
        errors.add(:base, 'issue date must always be less than expiry date')
      end
    end
end
