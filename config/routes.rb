# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'welcome#index'

  draw :api_v0
end
