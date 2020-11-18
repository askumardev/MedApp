Rails.application.routes.draw do
  devise_for :users
  # get 'home/index'
  root to: 'home#index'
  devise_scope :users do
  	get 'sign_in', to: 'devise/sessions#new'
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
