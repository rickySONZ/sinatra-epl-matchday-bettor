class User < ActiveRecord::Base

    has_secure_password

    validates :email, uniqueness: true, presence: true

    has_many :scoreboards

    has_many :follows

    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower

    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

end