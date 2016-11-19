require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new }

  it { is_expected.to be_valid }
end
