class Character < ApplicationRecord
  has_many :powers
  mount_uploader :photo, PhotoUploader
end
