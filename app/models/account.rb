class Account < ApplicationRecord
  has_secure_password
  has_many :graphs
  has_many :tweets, through: :graphs
end
