# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts
  scope module: :posts do
    resources :comments, except: %w[index show]
  end
  # END
end
