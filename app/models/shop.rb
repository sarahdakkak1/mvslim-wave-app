class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  searchkick
end
