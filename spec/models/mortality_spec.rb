require 'rails_helper'

RSpec.describe Mortality, type: :model do
  subject { build :mortality }

  it { is_expected.to be_valid }
end
