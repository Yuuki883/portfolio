class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts

  attachment :image

  validates :name, presence: true, length: {maximum: 20, minimum: 1}
  validates :introduce, length: { maximum: 1000 }
end
