Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :time_registrations

  resources :employees do
    get 'blank_time_sheet', on: :member
  end

end
