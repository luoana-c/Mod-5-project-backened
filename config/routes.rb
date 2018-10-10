Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do 
      resources :users
      resources :children

      post '/signin', to: 'users#signin'
      get '/validate', to: 'users#validate'
      
      get '/children/:id/days', to: "children#days"
      get '/children/:id/days/:date', to: "days#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
