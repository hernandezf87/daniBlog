class Post < ApplicationRecord
  has_many_attached :images
  validate :image_type
  #validate :image, presence: false

  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end

  private
  def image_type
    if images.attached? == true
      errors.add(:images, "are missing")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg/png'))
        errors.add(:images, 'needs to be a JPEG or PNG')
      end
    end
  end
end
