# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index', as: 'home'

  get 'about' => 'home#about'

  namespace :account do
    resources :users
  end
end
