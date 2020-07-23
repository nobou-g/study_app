class Event < ApplicationRecord
  belongs_to :user
  has_many :messages
  mount_uploader :image, ImagesUploader

  with_options presence: true do
    validates :title
    validates :discription
    validates :image
    validates :place
    validates :date
  end
end
