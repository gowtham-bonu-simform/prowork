class Experience < ApplicationRecord
  belongs_to :profile

  validates :company, :title, :country, presence: true
end
