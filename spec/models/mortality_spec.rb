# == Schema Information
#
# Table name: mortalities
#
#  id           :integer          not null, primary key
#  count        :integer
#  house_id     :integer
#  registrar_id :integer
#  cause        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Mortality, type: :model do
  let(:user) { create :user, email: 'avoid@trouble.com' }
  subject { build :mortality, registrar: user }

  it { is_expected.to be_valid }
end
