class AddUserIdToTopicComments < ActiveRecord::Migration[5.2]
  def change
    add_column :topic_comments, :user_id, :integer
  end
end
