Rails.application.routes.draw do
  resources :user_exams
  resources :exams
  resources :exam_windows
  resources :users
  resources :colleges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
