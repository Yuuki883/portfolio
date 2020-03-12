class RenameIntroduceColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :introduce, :introduction
  end
end
