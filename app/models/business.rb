class Business < ApplicationRecord
  has_many :shops
  has_many :restaurants
  searchkick
end
