require 'test_helper'

class Public::PurchasRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_purchas_recipes_index_url
    assert_response :success
  end

  test "should get create" do
    get public_purchas_recipes_create_url
    assert_response :success
  end

  test "should get update" do
    get public_purchas_recipes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_purchas_recipes_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get public_purchas_recipes_destroy_all_url
    assert_response :success
  end
end
