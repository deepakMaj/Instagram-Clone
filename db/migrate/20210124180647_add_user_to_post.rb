class AddUserToPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :user_id
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
