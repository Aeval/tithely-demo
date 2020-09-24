Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'series#index'

  resources :series, param: :slug
  resources :sermons, param: :id

  resources :sermons do
    member do
      delete :delete_image_attachment
    end
  end

  resources :series do
    member do
      delete :delete_image_attachment
    end
  end

  get 'sermons' => 'sermons#index'
end
