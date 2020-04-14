class AddUserIdToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :user_id, :integer
  end
end
