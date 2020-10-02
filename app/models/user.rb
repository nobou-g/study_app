class User < ApplicationRecord

  has_many :messages
  has_many :events
  has_many :items
  has_many :active_relationships, class_name: 'Relationship',
              foreign_key: 'user_id',
              dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follow
  has_many :passive_relationships, class_name: 'Relationship',
              foreign_key: 'follow_id',
              dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :affiliation
    validates :introduction
  end

  def follow(other_user)
    unless self == other_user
      followings << other_user
    end
  end

  def unfollow(other_user)
    unless self == other_user
      self.active_relationships.find_by(follow_id: other_user.id)
    end
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
end
