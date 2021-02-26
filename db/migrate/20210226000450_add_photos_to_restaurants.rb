class AddPhotosToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :photo, :string
  end
end
