Rails.application.routes.draw do
  resources :users, only:[:create, :destroy, :index, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
