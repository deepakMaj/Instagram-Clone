class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :desc
      t.integer :post_id
      t.string :post_url

      t.timestamps
    end
  end
end
