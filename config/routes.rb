Rails.application.routes.draw do

  root 'main#index'

  get 'admin', :to => 'admin#menu'

  get 'admin/login'

  get 'admin/menu'

  post 'admin/attempt_login'

  get 'admin/logout'

  resources :customers do
    resources :events
  end

  resources :customer do
    member do
      get :delete
    end
  end


  resources :admin do
    member do
      get :delete
    end
  end


  resources :events do
    member do
      get :delete
    end
  end

  resources :future_events do
    member do
      get :delete
    end
  end

  get 'main/index'

  get 'main/formacion'

  get 'main/evangelizacion'

  get 'main/rccho'

  get 'main/checkout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
