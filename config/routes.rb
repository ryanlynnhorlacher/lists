Rails.application.routes.draw do

  root to: 'lists#index'

  resources :lists do 
    resources :tasks, shallow: true
  end

  post '/lists/:id', to: 'tasks#to_list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
