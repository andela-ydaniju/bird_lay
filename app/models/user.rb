class User < ApplicationRecord
  validates :email, presence: true

  has_secure_password

  has_many :houses
end
