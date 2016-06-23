Rails.application.routes.draw do


  # Default static pages for giving information
  get '/about', to: 'static_pages#about'
  get '/help',  to: 'static_pages#help'

  authenticate :user do
    resources :questions, only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :questions, only: [:index, :show] do
    resources :answers
  end
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' },
             :skip => [:sessions, :registrations]
  as :user do
    get     'signin'  => 'users/sessions#new', :as => :new_user_session
    post    'signin'  => 'users/sessions#create', :as => :user_session
    delete  'signout' => 'users/sessions#destroy', :as => :destroy_user_session
    
    get     'signup'     => 'users/registrations#new', :as => :new_user_registration
    post    'signup'     => 'users/registrations#create', :as => :user_registration
    get     '/users/:id' => 'users#profile', :as => :user_profile
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
