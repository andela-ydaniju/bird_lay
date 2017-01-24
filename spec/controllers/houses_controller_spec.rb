require 'rails_helper'

RSpec.describe HousesController, type: :controller do
  describe '#new' do
    context 'when not signed in' do
      it 'redirects to root' do
        get :new

        expect(response).to have_http_status 404
        expect(response).to render_template(file: "#{Rails.root}/public/404.html")
      end
    end

    context 'when signed in' do
      it 'renders page for creating new house' do
        house = create :house

        get :new, session: { user_id: house.user.id }

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#index' do
    context 'when not signed in' do
      it 'redirects to root' do
        get :index

        expect(response).to have_http_status 404
        expect(response).to render_template(file: "#{Rails.root}/public/404.html")
      end
    end

    context 'when signed in' do
      it 'renders page for all houses' do
        house = create :house

        get :index, session: { user_id: house.user.id }

        expect(response).to render_template(:index)
      end
    end
  end

  describe '#show' do
    context 'when not signed in' do
      it 'redirects to root' do
        house = create :house
        get :show, params: { id: house.id }

        expect(response).to have_http_status 404
        expect(response).to render_template(file: "#{Rails.root}/public/404.html")
      end
    end

    context 'when signed in' do
      context 'if house exists' do
        it 'renders a house' do
          house = create :house
          get :show, params: { id: house.id }, session: { user_id: house.user.id }

          expect(response).to render_template(:show)
        end
      end

      context 'if house does not exist' do
        it 'renders a house' do
          house = create :house

          get :show, params: { id: -1 }, session: { user_id: house.user.id }

          expect(response).to redirect_to('/404.html')
        end
      end
    end
  end

  describe '#create' do
    context 'when not signed in' do
      let(:new_house) { build :house }
      
      it 'redirects to root' do
        post :create, params: {
          name: new_house.name, code: new_house.code,
          capacity: new_house.capacity, feed_consumption: new_house.feed_consumption,
          population: new_house.population
        }

        expect(response).to have_http_status 404
        expect(response).to render_template(file: "#{Rails.root}/public/404.html")
      end
    end

    context 'when signed in' do
      it 'creates a new house' do
        house = create :house
        new_user = User.create(
          email: 'test@user.com',
          password: 'password',
          level: 2
        )
        new_house = build :house, user: new_user
        login(new_user)

        expect do
          post :create, params: { house: {
            name: new_house.name, code: new_house.code,
            capacity: new_house.capacity, feed_consumption: new_house.feed_consumption,
            population: new_house.population
          } }, session: { user_id: new_house.user.id }

        end.to change(House, :count).by 1
      end
    end

    context 'when signed in and params incorrect' do
      it 'does not create a new house' do
        house = create :house
        new_user = User.create(
          email: 'test@user.com',
          password: 'password',
          level: 2
        )
        new_house = build :house, name: nil, user: new_user
        login(new_user)

        expect do
          post :create, params: { house: {
            name: new_house.name, code: new_house.code,
            capacity: new_house.capacity, feed_consumption: new_house.feed_consumption,
            population: new_house.population
          } }, session: { user_id: house.user.id }
        end.to change(House, :count).by 0

      end
    end
  end

  describe '#register_mortality' do
    it 'renders a house' do
      user = create :user, email: 'new_email@new.com'
      house = create :house, user: user

      mortality = build :mortality, registrar: user
      post :register_mortality, params: { mortality: {
          cause: mortality.cause, count: mortality.count,
          registrar_id: mortality.registrar_id,
          house_id: house.id
        }
      }, session: { user_id: house.user.id }

      expect(response).to redirect_to(house_path(house.id))
    end
  end
end
