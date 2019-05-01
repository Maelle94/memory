class Camera < ApplicationRecord
  include PgSearch

  pg_search_scope :search, against: [:name], using: { tsearch: { prefix: true } }

  has_many :images
  has_one_attached :avatar
end
