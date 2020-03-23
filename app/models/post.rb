class Post < ApplicationRecord
    belongs_to  :user
    has_many    :favorites
    has_many    :favorited_users, through: :favorites, source: :user, dependent: :destroy
    has_many    :post_images, dependent: :destroy
    accepts_attachments_for :post_images, attachment: :image
    validates   :title, presence: true
	validates   :content, presence: true, length: {maximum: 200}
end
