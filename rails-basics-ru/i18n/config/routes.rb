# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'home#index'
  scope '/:locale', locale: /en|ru/ do
    resources :posts
  end
  scope module: :posts do
    resources :post_comments
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
