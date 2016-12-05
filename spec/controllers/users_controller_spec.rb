require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

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
end
