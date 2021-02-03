class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  validates :content, length: { minimum: 20 }
end
