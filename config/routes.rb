Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /en|es/ do
    get 'home/grettings'
    namespace :v1, defaults: { format: 'json' } do
      resources :users, only: %i[create] do
        post 'login', on: :collection
      end
      resources :stores, only: %i[show]
      resources :products, only: %i[create]
    end
  end
end
