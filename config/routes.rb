Rails.application.routes.draw do

  root 'main#index'

  get 'admin', :to => 'admin#menu'

  get 'admin/login'

  post 'admin/attempt_login'

  get 'logout', :to => 'admin#logout'

  resources :customers, only: [:create] do
  end

  resources :events, only: [:show, :create, :update, :destroy], :path => 'registered', param: :title  do
  end

  resources :future_events, only: [:create, :update, :destroy] do
  end

  get 'main/index'

  get 'formacion', :to => 'main#formacion'

  get 'evangelizacion', :to => 'main#evangelizacion'

  get 'rccho', :to => 'main#rccho'

  get 'selected_event', :to => 'main#find_event'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
