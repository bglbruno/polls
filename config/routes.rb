Rails.application.routes.draw do
  root 'polls#index'
  resources :polls do
    resources :votes, only: [:create, :update, :destroy]
  end

end
