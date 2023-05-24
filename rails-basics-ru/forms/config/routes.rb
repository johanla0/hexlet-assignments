# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'posts#index'
  resources :posts, except: :index
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
