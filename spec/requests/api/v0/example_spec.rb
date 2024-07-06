# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/v0/api_status', type: :request do
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }

  describe 'POST /sign_in' do
    before do
      get '/api/v0/api_status', headers:
    end

    describe 'Success' do
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'Failure' do
      context 'when user is not logined' do
        let(:headers) { {} }

        it 'returns unauth' do
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
