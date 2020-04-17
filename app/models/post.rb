class Post < ApplicationRecord
    belongs_to  :user
    has_many    :favorites
    has_many    :favorited_users, through: :favorites, source: :user, dependent: :destroy
    has_many    :post_images, dependent: :destroy
    accepts_attachments_for :post_images, attachment: :image
    validates   :place_name, presence: true, length: {maximum: 20, minimum: 1}
    validates   :title, presence: true, length: {maximum: 20, minimum: 1}
    validates   :content, presence: true, length: {maximum: 200, minimum: 1}
end
