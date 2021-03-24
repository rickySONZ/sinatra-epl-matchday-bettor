class User < ActiveRecord::Base

    has_secure_password

    validates :email, uniqueness: true

    has_many :scoreboards

    has_and_belongs_to_many(:users,
    :join_table => "user_connections",
    :foreign_key => "user_a_id",
    :association_foreign_key => "user_b_id")
    

end