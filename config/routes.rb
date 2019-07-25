Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end

end
