# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  level           :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password

  has_many :houses
  has_many :mortalities

  after_create :hierarchy, :is_admin?

  def hierarchy
    return 'Admin' if self.level == 2
    return 'Manager' if self.level == 1
    return 'Supervisor'
  end

  def is_admin?
    self.level == 2
  end
end
