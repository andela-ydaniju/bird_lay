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

require 'rails_helper'
RSpec.describe House, type: :model do
  subject { build :house }

  it { is_expected.to be_valid }
end
