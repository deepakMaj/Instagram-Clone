class Follow < ApplicationRecord

    # Counter_Cache -> Helps to store the value in cache fetched from database
    # and updates the value when the resource is created or destroyed without fetching from database again. 

    belongs_to :follower, class_name: "User", foreign_key: "follower_id", 
                counter_cache: :followings_count,
                inverse_of: :following_relationships
    
    belongs_to :following, class_name: "User", foreign_key: "following_id",
                counter_cache: :followers_count,
                inverse_of: :follower_relationships
end
