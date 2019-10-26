# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :account, controllers: {
    confirmations: 'accounts/confirmations',
    passwords: 'accounts/passwords',
    registrations: 'accounts/registrations',
    sessions: 'accounts/sessions',
    unlocks: 'accounts/unlocks'
  }

  resources :dashboard, only: [:index]

  resources :profile, only: [:show]
  resources :friends, only: [:index]

  namespace :my do
    resources :health, only: [:index]
    namespace :health do
      resources :sleeps, only: %i[index new create edit update]
      resources :body_weights, only: %i[index new create edit update]
      resources :body_measures, only: %i[index new create edit update]
    end

    resources :productivity, only: [:index]

    resources :activity, only: [:index]
    namespace :activity do
      resources :gym, only: [:index]
      resources :running, only: [:index]
      resources :outdoor_walks, only: %i[index new create edit update]
      resources :cycling, only: [:index]
      resources :yoga, only: [:index]
      namespace :yoga do
        resources :asana, only: [:index]
        resources :pranayama, only: [:index]
        resources :uddiyana, only: [:index]
        resources :affirmation, only: [:index]
      end
      resources :stretching, only: [:index]
    end

    resources :emotions, only: [:index]

    resources :learning, only: [:index]
    namespace :learning do
      resources :videos, only: %i[index new create]
      resources :podcasts, only: %i[index new create edit update]
      resources :articles, only: %i[index new create edit update]
      resources :books, only: [:index]
    end

    resources :family, only: [:index]
  end

  root 'home#index'
end
