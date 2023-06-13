class Certification < ApplicationRecord
  belongs_to :profile

  validates :issue_date, presence: true
  validate :valid_url

  private

    def valid_url
      unless certification_url.starts_with? 'https://' and certification_url.ends_with? '.com'
        errors.add(:certification_url, 'must be a valid url, for example: https://sampler.com')
      end
    end
end
