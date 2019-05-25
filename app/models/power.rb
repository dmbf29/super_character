class Power < ApplicationRecord
  belongs_to :character
  mount_uploader :photo, PhotoUploader
end
