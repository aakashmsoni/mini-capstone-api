Rails.application.routes.draw do
  # get "/products", controller: "products", action: "products"

  # get "/products_under_20", controller: "products", action: "products_under_20"

  # PRODUCT ROUTES
  # Product Index
  get "/products" => "products#index"

  # Product under 20
  get "/products_under_20" => "products#products_under_20"

  # Product show
  get "/products/:id" => "products#show"

  # Product Create
  post "/products" => "products#create"

  # Product Create Post
  post "/products" => "products#create"

  # Product Update
  patch "/products/:id" => "products#update"

  # Product Delete
  delete "/products/:id" => "products#destroy"

  # SUPPLIER ROUTES
  # Supplier Index
  get "/suppliers" => "suppliers#index"

  # Supplier Show
  get "/suppliers/:supplier_id" => "suppliers#show"

  # Supplier Create
  post "/suppliers" => "suppliers#create"

  # Supplier Update
  patch "/suppliers/:supplier_id" => "suppliers#update"

  # Supplier Delete
  delete "/suppliers/:supplier_id" => "suppliers#destroy"

  # IMAGE ROUTES
  # Image Index
  get "/images" => "images#index"

  # Image Show
  get "/images/:id" => "images#show"

  # Image Create
  post "/images" => "images#create"

  # USER ROUTES
  # User Create
  post "/users" => "users#create"

  # Session Create
  post "/sessions" => "sessions#create"

  # Order Index
  get "/orders" => "orders#index"
  
  # Order Show
  get "/orders/:id" => "orders#show"

  # Order Create
  post "/orders" => "orders#create"
end
