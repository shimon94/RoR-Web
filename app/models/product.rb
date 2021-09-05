class Product < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    scope :with_eager_loaded_image, -> { eager_load(image_attachment: :blob) }
  
end
