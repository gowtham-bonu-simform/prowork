class Profile < ApplicationRecord
  validates :professional_role, :bio, :hourly_rate, :phone, :country, :street_address, :city, :state, presence: true
  validates :professional_role, length: {minimum: 4}
  validates :bio, length: {minimum: 100}
  validates :hourly_rate, numericality: {in: 3..999}
  validates :phone, length: {is: 10}
  validates :skill_list, presence: true
  validates :service_list, presence: true

  belongs_to :user
  with_options dependent: :destroy do |assoc|
    assoc.has_many :experiences
    assoc.has_many :education_histories
    assoc.has_many :languages
    assoc.has_many :certifications
  end
  accepts_nested_attributes_for :experiences, :education_histories, :languages, :certifications

  acts_as_taggable_on :skills
  acts_as_taggable_on :services

  after_create :english_must_exist

  private

    def english_must_exist
      unless languages.pluck(:name).include? 'English'
        errors.add(:base, 'English must be selected as a language')
        raise ActiveRecord::Rollback
      end
    end

    def max_skills
      if skill_list.count > 15
        errors.add(:skill_list, 'maximum 15 skills can be added')
      end
    end
end
