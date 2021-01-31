class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :post_url, presence: true
  validates :desc, presence: true

  # def like(user)
  #   likes << Like.new(user: user)
  # end

  # def unlike(user)
  #   likes.where(user_id: user.id).first.destroy
  # end
end
