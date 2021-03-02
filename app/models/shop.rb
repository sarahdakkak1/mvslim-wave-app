class Shop < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    multisearchable against: [ :name, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
