# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'home#index'

    # BEGIN
    resources :movies do
      scope module: :movies do
        resources :comments, except: %i[show]
        resources :reviews, except: %i[show]
      end
    end
    # END

    resources :reviews, only: %i[index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
