class GraphSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :tweets, serializer: GraphTweetSerializer
end
