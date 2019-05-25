class Character < ApplicationRecord
  has_many :character_powers, dependent: :destroy
  has_many :powers, through: :character_powers
  mount_uploader :photo, PhotoUploader
end
