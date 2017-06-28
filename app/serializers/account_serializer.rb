class AccountSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest
  has_many :searches, serializer: AccountSearchSerializer
end
