class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments

  validates :username, presence: true

  def like_post!(post)
    post.likes << Like.new(user_id: self.id)
  end

  def like_comment!(comment)
    comment.likes << Like.new(user_id: self.id)
  end

end
