require 'test_helper'

class Admin::FoodGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_food_genres_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_food_genres_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_food_genres_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_food_genres_destroy_url
    assert_response :success
  end

end