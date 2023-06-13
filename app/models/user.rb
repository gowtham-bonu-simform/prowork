class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :policy, acceptance: true

  has_many :posts, dependent: :destroy

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
