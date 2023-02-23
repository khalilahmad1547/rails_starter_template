require 'rails_helper'

RSpec.describe 'Auths', type: :request do
  describe 'POST /login' do
    let(:user) { create(:user) }

    it 'should be unauthorized when user not exists' do
      post '/login'
      expect(response).to have_http_status :unauthorized
    end

    it 'should be success when valid email & password given' do
      post '/login', params: { user: { email: user.email, password: user.password } }
      expect(response).to be_ok
    end
  end
end
