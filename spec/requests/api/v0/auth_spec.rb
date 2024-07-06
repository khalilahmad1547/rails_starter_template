# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v0/auth', type: :request do
  let(:name) { Faker::Name.name }
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }
  let(:confirm_success_url) { 'url' }
  let(:login_params) { { email:, password: } }
  let(:sign_up_params) { { email:, password:, name:, confirm_success_url: } }
  let(:user) { create(:user, name:, email:, password:) }
  let(:headers) { user.create_new_auth_token }
  let(:create_user) {}

  describe 'Signup' do
    before do
      create_user
      post '/api/v0/auth', params: sign_up_params
    end

    describe 'Success' do
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'Failure' do
      context 'when email is not provided' do
        let(:sign_up_params) { { password:, name:, confirm_success_url: } }

        it 'should return failure' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when password is missing' do
        let(:sign_up_params) { { email:, name:, confirm_success_url: } }

        it 'should return failure' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when success url is missing' do
        let(:sign_up_params) { { email:, name: } }

        it 'should return failure' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'when user already exist' do
        let(:create_user) { user }

        it 'should return failure' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'Signin' do
    before do
      user
      post '/api/v0/auth/sign_in', params: login_params
    end

    describe 'Success' do
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'Failure' do
      context 'when email is incorrect' do
        let(:login_params) { { email: Faker::Internet.email, password: } }

        it 'should return failure' do
          expect(response).to have_http_status(:unauthorized)
        end
      end

      context 'when password is incorrect' do
        let(:login_params) { { email:, password: 'incorect' } }

        it 'should return failure' do
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end

  describe 'Signout' do
    before do
      user
      delete '/api/v0/auth/sign_out', headers:
    end

    describe 'Success' do
      it 'should return ok' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'Failure' do
      context 'when headers are not correct' do
        let(:headers) { {} }

        it 'should return not found' do
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
