class Post < ApplicationRecord
  has_many_attached :images
  validate :image_type
  #validate :image, presence: false

  def thumbnail input
    return self.images[input].variant(resize: '300x300!').processed
  end
end
