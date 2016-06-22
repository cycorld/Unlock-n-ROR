Rails.application.routes.draw do


  get '/about', to: 'static_pages#about'
  get '/help',  to: 'static_pages#help'

  
  resources :questions do
    resources :comments
  end
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
