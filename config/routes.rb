Changeons::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :mailing_list_recipients, only: [:create]
    end
  end

  # devise_for :users, controllers: { registrations: 'users/registrations' }
end
