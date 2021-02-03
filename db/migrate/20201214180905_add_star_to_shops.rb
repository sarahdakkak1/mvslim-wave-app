class AddStarToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :star, :integer
  end
end
