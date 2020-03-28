class Topic < ApplicationRecord
    belongs_to :user
    has_many :topic_comments, dependent: :destroy
    validates :title, presence: true
end
