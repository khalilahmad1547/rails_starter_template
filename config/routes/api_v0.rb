# frozen_string_literal: true

namespace :api do
  namespace :v0 do
    mount_devise_token_auth_for 'User', at: 'auth'
    get 'api_status', to: 'example#index'
  end
end
