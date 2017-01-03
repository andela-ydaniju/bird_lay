require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create :user }

  describe '#create' do
    context 'when not signed in' do
      context 'params are correctly entered' do
        it 'signs in' do
          post :create, params: {
            session: { email: user.email, password: user.password }
          }

          expect(response).to redirect_to(dashboard_url)
        end
      end

      context 'params are not correctly entered' do
        it 'signs in' do
          post :create, params: {
            session: { email: user.email, password: nil }
          }

          expect(response).to render_template 'home/index'
        end
      end
    end
  end

  describe '#destroy' do
    context 'when signed in' do
      it 'signs user out' do
        delete :destroy, params: {
          id: user.id,
          session: { email: user.email, password: user.password }
        }

        expect(response).to redirect_to(root_url)
      end
    end
  end
end
