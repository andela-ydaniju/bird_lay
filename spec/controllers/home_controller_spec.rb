require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context '#index' do
    it 'renders login page' do
      get :index

      expect(response).to have_http_status(200)
    end
  end
end
