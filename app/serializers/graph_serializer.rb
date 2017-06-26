class GraphSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :tweet
end
