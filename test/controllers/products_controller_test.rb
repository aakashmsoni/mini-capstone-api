require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
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
    assert_equal ["id", "name", "price", "description", "supplier", "images", "inventory"], data.keys
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
        }
      assert_response 200
    end

    post "/products.json", params: {}
    assert_response 422
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Crystal Skull" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Crystal Skull", data["name"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
