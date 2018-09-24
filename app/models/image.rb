class Image < ApplicationRecord
  belongs_to :camera
  belongs_to :category
  has_one_attached :avatar
  has_many_attached :multi_images
end
