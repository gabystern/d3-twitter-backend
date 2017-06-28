class Graph < ApplicationRecord
  belongs_to :search
  has_many :tweets
end
