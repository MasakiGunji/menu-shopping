Rails.application.routes.draw do

  root to:'public/homes#top'
  get 'about', to: 'public/homes#about'
  get 'admin', to: 'admin/homes#top'
  get 'recipes/index_all', to: 'public/recipes#index_all'
  delete 'purchas_recipes/destroy_all', to: 'public/purchas_recipes#destroy_all'
  delete 'purchas_foods/destroy_all', to: 'public/purchas_foods#destroy_all'


  namespace :admin do
    resources :foods, except: [:show,:new]
    resources :food_genres, except: [:edit,:new,:show]
    resources :recipe_genres, except: [:edit,:new,:show]
  end

  scope module: "public" do
    resources :recipes do
      resources :recipe_foods, only: [:index, :new, :create, :update, :destroy]
    end
    resources :purchas_recipes, except: [:new, :show]

    resources :purchas_foods, except: [:new, :show]
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
