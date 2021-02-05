class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user, optional: true
  has_many_attached :photos
end
