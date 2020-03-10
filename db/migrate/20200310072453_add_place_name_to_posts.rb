class AddPlaceNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :place_name, :string
  end
end
