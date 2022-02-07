Rails.application.routes.draw do
  resources :orders
  resources :restaurants
  post '/mattermost', to: 'mattermost#order'
end
