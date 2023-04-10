# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'properties#index'

  resources :properties
  resources :leases, except: %i[edit]
  resources :appointments, except: %i[edit new]
  get '*path' => redirect('/')
end
