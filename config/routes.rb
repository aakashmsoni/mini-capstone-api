Rails.application.routes.draw do
  # get "/products", controller: "products", action: "products"

  # get "/products_under_20", controller: "products", action: "products_under_20"
  # Product Index

  get "/products" => "products#products"
  # Product under 20

  get "/products_under_20" => "products#products_under_20"

  # Product show
  get "/products/:id" => "products#show"

  # Product Create
  post "/products.json" => "products#create"

  # Product Create Post
  post "/products" => "products#create"
end
