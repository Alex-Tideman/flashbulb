Rails.application.routes.draw do
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get  '/', to: 'home#show'
  get  '/feed', to: 'dashboard#feed'
  get  '/dashboard', to: 'dashboard#show'
  post '/search', to: 'dashboard#search'
  root 'home#show'
end
