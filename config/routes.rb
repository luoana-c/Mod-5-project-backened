Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do 
      resources :users
      resources :kids
      resources :naps
      resources :days
      resources :nappy_potties
      resources :foods
      resources :notes

      # post '/login', to: 'users#login'
      # this is used for the temporary authentication

      post '/signin', to: 'users#signin'
      get '/validate', to: 'users#validate'
      post '/signup', to: 'users#signup'
      # these are used for the jwt authentication
      
      get '/kids/:id/days', to: 'kids#days'
      post '/kids/:id/parents', to: 'kids#add_parent'
      post '/kids/:id/days', to: 'days#create'
      get '/kids/:id/days/:date', to: 'days#show'

    
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
