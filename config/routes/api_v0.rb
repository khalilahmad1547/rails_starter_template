# frozen_string_literal: true

namespace :api do
  namespace :v0 do
    get 'api_status', to: 'example#index'
  end
end
