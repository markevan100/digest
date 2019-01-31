Rails.application.routes.draw do

  root to: 'welcome#home'

  get 'welcome/about', to: 'welcome#about'
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/contacts', to: 'welcome#contacts'

  resources :recipes
  resources :responses
  resources :discussions
  resources :products
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end