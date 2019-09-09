Rails.application.routes.draw do

  get 'dashboard', to: 'dashboards#index', as: 'dashboard'
  put 'dashboard', to: 'dashboards#update', as: 'dashboard_update'
  delete 'dashboard/{user_id}', to: 'dashboards#delete', as: 'dashboard_delete'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
