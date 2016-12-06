require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  let(:new_user) { build :user }

  describe '#new' do
    context 'when not signed in' do
      it 'redirects to root' do
        get :new

        expect(response).to redirect_to(root_url)
      end
    end

    context 'when signed in' do
      it 'renders page for creating new user' do
        login(user)
        get :new, session: { user_id: user.id }

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'when not signed in' do
      it 'redirects to root' do
        post :create, params: { email: new_user.email, password: new_user.password }

        expect(response).to redirect_to(root_url)
      end
    end

    context 'when signed in' do
      it 'creates no user when params are incorrect' do
        new_user.email = nil
        login(user)

        expect {
          post :create, params: { user: { email: new_user.email, password: new_user.password }},
          session: { user_id: user.id }
        }.to change(User, :count).by 0
      end

      it 'creates new user when all params correct' do
        login(user)
        new_user.email = 'new@user.email'
        expect {
          post :create, params: { user: { email: new_user.email, password: new_user.password }},
          session: { user_id: user.id }
        }.to change(User, :count).by 1
      end
    end
  end
end
