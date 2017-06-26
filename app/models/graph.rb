class Graph < ApplicationRecord
  belongs_to :account
  has_many :tweets
end
