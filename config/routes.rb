Rails.application.routes.draw do
  # get "/all_products", controller: "products", action: "all_products"

  # get "/products_under_20", controller: "products", action: "products_under_20"
  # Product Index

  get "/all_products" => "products#all_products"
  # Product under 20

  get "/products_under_20" => "products#products_under_20"

  # Product show
  get "all_products/:id" => "products#show"

  # Product Create
  post "all_products.json" => "products#create"
end
