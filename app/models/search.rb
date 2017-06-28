class Search < ApplicationRecord
  belongs_to :account
  has_many :graphs
  has_many :tweets, through: :graphs
end
