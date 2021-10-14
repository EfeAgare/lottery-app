Rails.application.routes.draw do
  root 'lottery_draw#index'
  post 'user_lottery/create', to: 'user_lottery#create', as: :user_lottery
  get 'user_lottery/index', to: 'user_lottery#index', as: :user_lottery_index
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
