Rails.application.routes.draw do
  get '/', to: "users#index"
  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :create] do
      resources :likes, only: [:create], module: :posts

    member do
      get :posts # This creates a route for users/:id/posts
    end
  end

end
