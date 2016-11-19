require 'rails_helper'

RSpec.describe House, type: :model do
  let(:admin) { create :admin }
  subject(:house) { build :house, admin_id: admin.id }

  it { is_expected.to be_valid }
end
