Rails.application.routes.draw do
  root 'polls#index'

  resources :polls do
    collection do
      get 'filter/:filter', to: :index, as: :filter
    end
    resources :votes, only: [:create, :update, :destroy]
  end
end
