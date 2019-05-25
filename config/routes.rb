Rails.application.routes.draw do
  root to: 'characters#index'
  resources :characters, only: [:new, :create] do
    resources :character_powers, only: [:new, :create]
  end
end
