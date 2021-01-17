Rails.application.routes.draw do

  root to:'public/homes#top'
  get 'about', to: 'public/homes#about'
  get 'admin', to: 'admin/homes#top'

  namespace :admin do
    resources :admin_foods, except: [:show,:new]
    resources :food_genres, except: [:edit,:new,:show]
    resources :recipe_genres, except: [:edit,:new,:show]
  end

  scope module: "public" do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :new, :create, :show]
  end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
