require 'test_helper'

class Public::PurchasFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_purchas_foods_index_url
    assert_response :success
  end

  test "should get create" do
    get public_purchas_foods_create_url
    assert_response :success
  end

  test "should get update" do
    get public_purchas_foods_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_purchas_foods_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get public_purchas_foods_destroy_all_url
    assert_response :success
  end
end
