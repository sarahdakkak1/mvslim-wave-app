class RemoveBusinessFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_reference :restaurants, :business, foreign_key: true
  end
end
