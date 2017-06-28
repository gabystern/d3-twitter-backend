class GraphSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :search
  has_many :tweets, serializer: GraphTweetSerializer
end
