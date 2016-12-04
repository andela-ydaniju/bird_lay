# == Schema Information
#
# Table name: houses
#
#  id               :integer          not null, primary key
#  name             :string
#  code             :string
#  capacity         :integer
#  population       :integer
#  user_id          :integer
#  feed_consumption :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class House < ApplicationRecord
  belongs_to :user, -> { where(admin: true) }
end
