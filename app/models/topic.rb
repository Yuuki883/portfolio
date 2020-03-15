class Topic < ApplicationRecord
    has_many :topic_comments, dependent: :destroy
    validates :title, presence: true
end
