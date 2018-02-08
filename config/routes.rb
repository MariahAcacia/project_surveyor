Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'surveys#index'
  resources :surveys do
    resources :questions, shallow: true
    # custom route to take you to "create" but to just start question process then that takes you to "create" and it creates the question and option records
  end



end
