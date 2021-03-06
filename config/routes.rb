Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  root 'home#index'
  resources :albums, only: [:index, :show] do
    resources :pictures, only: [] do
      resources :picture_comments, only: [:index,:create]
    end
  end
end
