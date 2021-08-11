Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:new, :create]
    collection do
      get 'top'
      # GET 'restaurants/top'
    end
    member do
      get 'chef'
      # GET 'restaurants/:id/chef
    end
  end
  resources :reviews, only: [:destroy]

end
