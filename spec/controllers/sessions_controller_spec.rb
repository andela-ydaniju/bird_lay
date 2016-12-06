require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create :user }

  describe '#create' do
    context 'when not signed in' do
      it 'signs in' do
        post :create, params: {
          email: user.email, password: user.password,
          session: { email: user.email, password: user.password }
        }

        expect(response).to redirect_to(dashboard_url)
      end
    end
  end
end
