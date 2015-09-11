Rails.application.routes.draw do
  get '/auth/instagram/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get  '/', to: 'home#show'
  get  '/feed', to: 'dashboard#feed'
  get  '/dashboard', to: 'dashboard#show'
  get '/search', to: 'dashboard#search'
  get '/popular', to: 'dashboard#popular'
  root 'home#show'
end
