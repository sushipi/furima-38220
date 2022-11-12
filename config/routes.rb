Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :purchases, only:[:index, :create]
  end  
  root to: "items#index"
  #post "items/:id" => "items#update"
  
end
