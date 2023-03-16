require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)
    @order = Order.create(user_id: @user.id, product_id: Product.first.id, quantity: 10)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "supplier", "images", "inventory", "is_discounted?", "tax", "total"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json",
        params: {
          name: "test product",
          price: 1,
          inventory: 1,
          description: "test description",
          supplier_id: Supplier.first.id,
        },
        headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end

    post "/products.json", params: {}, headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 422

    post "/products.json", params: {}
    assert_response 401
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Crystal Skull" }, headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Crystal Skull", data["name"]

    patch "/products/#{product.id}.json", params: { name: "" }, headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 422

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 401
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
