Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'creator/surveys#index'

  namespace :creator do
    resources :surveys do
      resources :questions
      post '/questions/build_question', to: 'questions#build_question'
    end
  end

  namespace :taker do
    resources :surveys
      resources :qestions
    end 
  end


end
