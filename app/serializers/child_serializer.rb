class ChildSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :users
  # has_many :users, through: :user_child
end
