class Event < ApplicationRecord
  belongs_to :user
  has_many :messages

  with_options presence: true do
    validates :title
    validates :discription
    validates :image
    validates :place
    validates :date
  end
end
