class SearchSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :account
  has_many :graphs, serializer: SearchGraphSerializer
end
