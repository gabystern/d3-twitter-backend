class TweetSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :graph
end
