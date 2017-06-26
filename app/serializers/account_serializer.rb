class AccountSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest
  has_many :graphs, serializer: GraphSerializer
end
