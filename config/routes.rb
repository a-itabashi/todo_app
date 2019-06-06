Rails.application.routes.draw do
  root to: "homes#index"

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :tasks, only: [:index, :create, :update]
    end
  end

end
