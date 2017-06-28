class Account < ApplicationRecord
  has_secure_password
  has_many :searches
  has_many :graphs, through: :searches
end
