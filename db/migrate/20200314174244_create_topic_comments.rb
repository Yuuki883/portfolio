class CreateTopicComments < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_comments do |t|
      t.string :name
      t.text :body
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
