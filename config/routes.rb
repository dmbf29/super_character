Rails.application.routes.draw do
  root to: 'characters#index'
  get 'search', to: 'characters#search', as: :characters_search
  resources :characters, only: [:index, :new, :create] do
    resources :character_powers, only: [:new, :create]
  end
end
