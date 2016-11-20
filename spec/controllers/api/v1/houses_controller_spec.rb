require 'rails_helper'

RSpec.describe Api::V1::HousesController, type: :controller do
  let(:admin) { create :admin }

  context '#index' do
    before do
      create_list(:house, 3, admin_id: admin.id)
    end
    it 'renders all houses' do
      get :index

      res = JSON.parse(response.body)
      expect(res.count).to eql 3
      expect(response).to have_http_status(200)
    end
  end

  context '#show' do
    before do
      create(:house, admin_id: admin.id)
    end
    it 'renders a house' do
      get :show, params: { id: House.first.id }

      res = JSON.parse(response.body)
      expect(res.keys).to include('code')
      expect(response).to have_http_status(200)
    end
  end

  context '#create' do
    let(:house) { build :house, admin_id: admin.id }
    it 'renders a house' do
      post :create, params: {
        name: house.name , code: house.code , capacity: house.capacity,
        stage: house.stage, admin_id: admin.id
      }

      res = JSON.parse(response.body)
      expect(response).to have_http_status(201)
    end
  end
end
