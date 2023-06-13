class Profile < ApplicationRecord
  validates :professional_role, :bio, :hourly_rate, :phone, :country, :street_address, :city, :state, presence: true
  validates :professional_role, length: {minimum: 4}
  validates :bio, length: {minimum: 100}
  validates :hourly_rate, numericality: {in: 3..999}
  validates :phone, length: {is: 10}
  validates :skill_list, presence: true

  belongs_to :user
  with_options dependent: :destroy do |assoc|
    assoc.has_many :experiences
    assoc.has_many :education_histories
    assoc.has_many :languages
    assoc.has_many :certifications
  end
  accepts_nested_attributes_for :experiences, :education_histories, :languages

  acts_as_taggable_on :skills
end
