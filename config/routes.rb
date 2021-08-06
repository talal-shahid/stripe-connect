Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  resources :payments, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'payments/new'
  get 'payment-thanks', to: 'payments#thanks', as: 'payment_thanks'
  get 'payment-error', to: 'payments#error', as: 'payment_error'
  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  get "stripe/connect", to: "stripe#connect", as: :stripe_connect
  get "stripe/dashboard/:user_id", to: "stripe#dashboard", as: :stripe_dashboard
  root to: 'payments#new'
end
