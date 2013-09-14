Tablefinder::Application.routes.draw do
  
  resources :users

  resources :places

  get "dashboard/index"
  root to: "dashboard#index"
end
