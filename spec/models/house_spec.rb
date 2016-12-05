require 'rails_helper'
RSpec.describe House, type: :model do
  subject { build :house }

  it { is_expected.to be_valid }
end
