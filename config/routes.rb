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
      resources :sleeps
      resources :body_weights
      resources :body_sizes
    end

    resources :productivity

    resources :activity, only: [:index]
    namespace :activity do
      resources :gym
      resources :running
      resources :walking
      resources :cycling
      resources :yoga, only: [:index]
      namespace :yoga do
        resources :asana
        resources :pranayama
        resources :uddiyana
        resources :affirmation
      end
      resources :stretching
    end

    resources :emotions

    resources :learning, only: [:index]
    namespace :learning do
      resources :videos
      resources :podcasts
      resources :articles
      resources :books
    end

    resources :family
  end

  root 'home#index'
end
