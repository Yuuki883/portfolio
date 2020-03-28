class TopicComment < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  validates :name, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
