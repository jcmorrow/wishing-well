Rails.application.routes.draw do
  resources :matches, only: [:create, :index, :new] do
    resource :win_rate, only: [:show]
    resource :turn_summary, only: [:show]
    resource :deck_list, only: [:show]
  end
  resources :strategies, only: [:create, :edit, :index, :new, :show] do
    resources :priorities, only: [:new, :create]
  end
  resources :priorities, only: [:update]
end
