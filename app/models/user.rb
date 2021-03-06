class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :topic_comments, dependent: :destroy
  has_many :maps, dependent: :destroy
  # has_many :maps, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

    def already_favorited?(post)
      self.favorites.exists?(post_id: post.id)
    end

    def following?(user)
      following_user.include?(user)
    end

    def follow(user_id)
      follower.create(followed_id: user_id)
    end
  
    def unfollow(user_id)
      follower.find_by(followed_id: user_id).destroy
    end

  attachment :image, destroy: false

  validates :name, presence: true, length: {maximum: 20, minimum: 1}
  validates :introduction, length: { maximum: 100 }
  validates :like_age, length: { maximum: 100 }
  validates :like_busho, length: { maximum: 100 }
end
