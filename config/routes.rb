Rails.application.routes.draw do
  # get "/all_products", controller: "products", action: "all_products"

  # get "/products_under_20", controller: "products", action: "products_under_20"

  get "/all_products" => "products#all_products"

  get "/products_under_20" => "products#products_under_20"
end
