require 'test_helper'

class Public::RecipesFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_recipes_foods_new_url
    assert_response :success
  end

  test "should get create" do
    get public_recipes_foods_create_url
    assert_response :success
  end

  test "should get update" do
    get public_recipes_foods_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_recipes_foods_destroy_url
    assert_response :success
  end

end
