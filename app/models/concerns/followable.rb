module Followable extend ActiveSupport::Concern
    
    include do
        # User has many followers through table follower_relationships via following_id of the other users.
        has_many :follower_relationships, class_name: "Follow", foreign_key: :following_id
        has_many :followers, through: :follower_relationships, source: :follower
        
        # User has many following to other users via follower_id in following_relationships table.
        has_many :following_relationships, class_name: "Follow", foreign_key: :follower_id
        has_many :following, through: :following_relationships, source: :following
    end

    def follow(user_id)
        following_relationships.create(following_id: user_id)
    end

    def unfollow(user_id)
        following_relationships.find_by(following_id: user_id).destroy
    end

    def isFollowing?(user_id)
        relationship = Follow.find_by(follower_id: id, following_id: user_id)
        return true if relationship
    end

end