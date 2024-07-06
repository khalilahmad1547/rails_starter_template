# frozen_string_literal: true

namespace :api do
  namespace :v0 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/v0/users/registrations'
    }
    get 'api_status', to: 'example#index'
  end
end
