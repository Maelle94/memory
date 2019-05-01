class Image < ApplicationRecord
  include PgSearch

  pg_search_scope :search, against: [:name], using: { tsearch: { prefix: true } }

  belongs_to :camera
  belongs_to :category
  has_one_attached :avatar
  has_many_attached :multi_images
end
