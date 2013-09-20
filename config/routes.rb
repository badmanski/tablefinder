Tablefinder::Application.routes.draw do

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  resources :users

  resources :places

  get "dashboard/index"
  root to: "dashboard#index"
end
