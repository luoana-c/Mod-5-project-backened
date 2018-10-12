class UserKid < ApplicationRecord
    belongs_to :user 
    belongs_to :kid 
end
