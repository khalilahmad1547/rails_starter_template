# frozen_string_literal: true

namespace :api do
  namespace :v0 do
    get '/rails_info', to: 'info#show'
  end
end
