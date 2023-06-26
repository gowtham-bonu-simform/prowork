class Experience < ApplicationRecord
  belongs_to :profile

  validates :company, :title, :country, presence: true
  validates :start_date, comparison: {less_than: :end_date}
end
