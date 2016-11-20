require 'rails_helper'

RSpec.describe Api::V1::HousesController, type: :controller do
  context '#index' do
    it 'renders all houses' do
      get :index

      expect(response).to have_http_status(200)
    end
  end
end
