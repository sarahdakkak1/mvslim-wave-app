class AddPhotosToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :photo, :string
  end
end
