# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  scope '/:locale', locale: /en|ru/ do
    resources :posts
    resources :posts do
      resources :comments, module: :posts
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
