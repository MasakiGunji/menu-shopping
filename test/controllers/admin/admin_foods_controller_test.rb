require 'test_helper'

class Admin::AdminFoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_admin_foods_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_admin_foods_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_admin_foods_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_admin_foods_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_admin_foods_destroy_url
    assert_response :success
  end

end
