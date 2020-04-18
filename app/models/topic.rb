class Topic < ApplicationRecord
    belongs_to :user
    has_many :topic_comments, dependent: :destroy
    validates :title, presence: true, length: {maximum: 50, minimum: 1}
end
