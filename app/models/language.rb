class Language < ApplicationRecord
  belongs_to :profile

  validates :name, :proficiency, presence: true
end
