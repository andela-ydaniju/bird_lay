require 'rails_helper'

RSpec.describe Api::V1::HousesController, type: :controller do
  context '#index' do
    let(:admin) { create :admin }
    before(:each) do
      create_list(:house, 3, admin_id: admin.id)
    end
    it 'renders all houses' do
      get :index

      body = JSON.parse(response.body)
      expect(body.count).to eql 3
      expect(response).to have_http_status(200)
    end
  end
end
