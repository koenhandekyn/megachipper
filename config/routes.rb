Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :time_registrations do
    post 'green', on: :collection
    post 'white', on: :collection
  end

  resources :employees do
    get 'blank_time_sheet', on: :member
    get 'time_sheet', on: :member
  end

  root to: "employees#index"

end
