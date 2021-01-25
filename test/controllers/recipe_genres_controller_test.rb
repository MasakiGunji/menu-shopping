require 'test_helper'

class RecipeGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipe_genres_index_url
    assert_response :success
  end

  test "should get create" do
    get recipe_genres_create_url
    assert_response :success
  end

  test "should get edit" do
    get recipe_genres_edit_url
    assert_response :success
  end

  test "should get update" do
    get recipe_genres_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recipe_genres_destroy_url
    assert_response :success
  end
end
