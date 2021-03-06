Rails.application.routes.draw do
  devise_for :users
  mount ForestLiana::Engine => '/forest'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show] do
    resources :menus, only: [:show, :create, :edit]
  end
end
