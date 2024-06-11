Rails.application.routes.draw do
  get '/', to: "users#index"
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
  resources :users, only: [:show, :index] do
    resources :posts, only: [:index]

    member do
      get :posts # This creates a route for users/:id/posts
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get "/users/:id", to: "users#show"
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'

  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#posts', as: 'user_posts'
  # get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts_with_comments'
  # get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  # Defines the root path route ("/")
  # root "posts#index"
end
