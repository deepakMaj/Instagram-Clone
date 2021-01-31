class AddUsersPostsToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :users, null: false, foreign_key: true
    add_reference :likes, :posts, null: false, foreign_key: true
  end
end
