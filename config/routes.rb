Tablefinder::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  resources :users

  resources :places

  get "dashboard", to: 'dashboard#index'
  post "dashboard/create_post"
  get "main/index"

  root to: "main#index"
end
