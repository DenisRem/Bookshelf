# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index', as: 'home'

  get 'about' => 'home#about'

  resources :users, except: %i[new create]
end
