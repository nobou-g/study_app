class User < ApplicationRecord

  has_many :messages
  has_many :events
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationship, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :affiliation
    validates :introduction
  end
end
