# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get]

  root to: 'home#index'

  resources :categories, only: %i[new create index] do
    resources :transactions, only: %i[index create new]
  end

  resources :users, only: %i[index]
end
