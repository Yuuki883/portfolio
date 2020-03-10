class Post < ApplicationRecord
    belongs_to :user
    has_many   :post_images

    validates :title, presence: true
	validates :content, presence: true, length: {maximum: 200}
end
