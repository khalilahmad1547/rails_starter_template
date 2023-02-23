require 'rails_helper'

RSpec.describe 'Auths', type: :request do
  describe 'POST /login' do
    before do
      user = { user: { email: Faker::Internet.email,
                       password: Faker::Internet.password } }
      user_db = { user: { email: Faker::Internet.email,
                          password: Faker::Internet.password } }
      post '/signup', params: user_db
    end
    it 'should be unauthorized when user not exists' do
      post '/login', params: user
      expect(response).to have_http_status :unauthorized
    end

    it 'should be success when valid email & password given' do
      post '/login', params: user_db
      expect(response).to have_http_status :create
    end
  end
end
