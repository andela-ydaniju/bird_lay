require 'rails_helper'
RSpec.describe Houses, type: :controller do
  let(house) { create :house }

  it { is_expected.to be_valid }
end
