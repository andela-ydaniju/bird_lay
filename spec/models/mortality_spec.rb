require 'rails_helper'

RSpec.describe Mortality, type: :model do
  let(:user) { create :user, email: 'avoid@trouble.com' }
  subject { build :mortality, registrar: user }

  it { is_expected.to be_valid }
end
