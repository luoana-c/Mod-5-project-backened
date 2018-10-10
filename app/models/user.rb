class User < ApplicationRecord
    has_secure_password
    has_many :user_children
    has_many :children, through: :user_children

    validates :email, uniqueness: true
    validates :email, uniqueness: {case_sensitive: false}

    # Create an array with all children of a user(childminder):
# User.all.find(1).user_children.map{|user_child| Child.all.find(user_child.child_id).first_name}
# => ["Maria", "Johnny", "Lilly"]

    def self.childminders 
        User.all.select{|user| user.childminder == true}
    end 

    def childminder_or_parent_children
        self.user_children.map{|user_child| Child.all.find(user_child.child_id)}
    end 
end
