Rails.application.routes.draw do


  get 'comments/create'
  get 'comments/update'
  get 'comments/destroy'

  resources :chatrooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  
  # Default static pages for giving information
  get '/about', to: 'static_pages#about'
  get '/help',  to: 'static_pages#help'
  root 'questions#index'
  
  authenticate :user do
    resources :questions, only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :questions, only: [:index, :show] do
    resources :comments
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
      put "favorite", to: "questions#favorite"
      put "unfavorite", to: "questions#unfavorite"
    end
    resources :answers do
      member do
        put "like", to: "answers#upvote"
        put "dislike", to: "answers#downvote"
      end
    end
  end

  resources :answers do
    resources :comments
  end
  
  devise_for :users, controllers:
                       { sessions: 'users/sessions', registrations: 'users/registrations',
                         passwords: 'users/passwords', omniauth_callbacks: 'users/omniauth_callbacks' },
             :skip => [:sessions, :registrations]
  as :user do
    get     'signin'  => 'users/sessions#new', :as => :new_user_session
    post    'signin'  => 'users/sessions#create', :as => :user_session
    delete  'signout' => 'users/sessions#destroy', :as => :logout
    
    get     'signup'     => 'users/registrations#new', :as => :new_user_registration
    post    'signup'     => 'users/registrations#create', :as => :user_registration
    get     '/users/:id' => 'users#show', :as => :user_profile
  end

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'users/omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'users/omniauth_callbacks#setup'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
