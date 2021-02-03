class Shop < ApplicationRecord
    has_many :reviews, dependent: :destroy
    searchkick
end
