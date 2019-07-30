Rails.application.routes.draw do
  resources :students, only: [:show, :new]
  resources :courses, only: [:index, :show]
end
