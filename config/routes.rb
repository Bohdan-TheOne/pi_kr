Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  
  resources :articles  do
    get '/private', to: 'articles#private_articles', on: :collection
    resources :comments
  end
end
