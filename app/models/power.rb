class Power < ApplicationRecord
  has_many :character_powers, dependent: :destroy
  has_many :characters, through: :character_powers
  mount_uploader :photo, PhotoUploader
end
