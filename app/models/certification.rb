class Certification < ApplicationRecord
  belongs_to :profile

  validates :issue_date, presence: true
  validates :issue_date, comparison: {less_than: :expiration_date}
  validates :cert_id, uniqueness: true
  validate :valid_url, if: ->{ !certification_url.nil? }

  
  private

    def valid_url
      unless certification_url.starts_with? 'https://' and certification_url.ends_with? '.com'
        errors.add(:certification_url, 'must be a valid url, for example: https://sampler.com')
      end
    end
end
