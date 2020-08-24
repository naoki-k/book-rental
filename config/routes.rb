Rails.application.routes.draw do
  resources :books
  post 'books/:id/rent', to: 'books#rent', as: 'rent_book'
  post 'books/:id/return', to: 'books#return', as: 'return_book'
  root to: 'sessions#new'
  post '/', to: 'sessions#create'
end
