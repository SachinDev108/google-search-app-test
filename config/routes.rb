Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => "/sidekiq" # monitoring console

  get '/importer', to: "home#importer"
  post '/import_csv', to: "data#importer"

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
