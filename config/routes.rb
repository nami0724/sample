Rails.application.routes.draw do

  devise_for :controllers
  devise_for :users

  resources :reservations do
  end


  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  devise_for :Users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms do
    collection do
      get 'post'
      get 'top'
      get 'profile'
      get 'search'
    end
  end


  root 'rooms#top'

end

