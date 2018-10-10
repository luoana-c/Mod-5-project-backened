class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :childminder, :phone_number, :address
end
