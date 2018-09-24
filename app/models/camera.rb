class Camera < ApplicationRecord
  has_many :images
  has_one_attached :avatar
end
