Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users
  get 'homes/about', to: 'homes#about', as: 'about'
  
  #コメントは投稿画像に対してコメントされるため、このような結びつきがある
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    

end
