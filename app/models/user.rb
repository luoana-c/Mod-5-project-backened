class User < ApplicationRecord
    has_secure_password
    has_many :user_kids
    has_many :kids, through: :user_kids

    validates :email, uniqueness: true, presence: true
    validates :email, uniqueness: {case_sensitive: false}
    after_initialize :childminder_bool
    # Create an array with all kids of a user(childminder):
# User.all.find(1).user_kids.map{|user_child| Child.all.find(user_child.child_id).first_name}
# => ["Maria", "Johnny", "Lilly"]

    def self.childminders 
        User.all.select{|user| user.childminder == true}
    end 

    def childminder_or_parent_kids
        self.user_kids.map{|user_kid| Kid.all.find(user_kid.kid_id)}
    end 
    
    private

    def childminder_bool 
        self.childminder = true if self.childminder.nil?
    end
end
