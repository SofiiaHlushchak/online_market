Rails.application.routes.draw do
  root 'products#index'
  get '/admin/users_count', to: 'admin#users_count'
  resources :products do
    get :upvote, on: :member
    get :expensive, on: :collection
  end
end
