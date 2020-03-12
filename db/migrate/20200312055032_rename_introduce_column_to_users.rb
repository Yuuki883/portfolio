class RenameIntroduceColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :introduction, :introduction
  end
end
