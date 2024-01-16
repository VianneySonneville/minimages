class Minimage < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  validates :title, presence: true
end
