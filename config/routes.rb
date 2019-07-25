Rails.application.routes.draw do
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end

end
