class Minimage < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumbnails, resize_to_fill: [50, 50]
  end

  has_many_attached :images

  validates :title, presence: true

  def image_base64
    return base64 unless base64.nil?

    update base64: Base64.encode64(image.download)

    base64
  end
end

