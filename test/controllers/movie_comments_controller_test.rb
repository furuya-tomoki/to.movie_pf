require 'test_helper'

class MovieCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get movie_comments_show_url
    assert_response :success
  end

  test "should get update" do
    get movie_comments_update_url
    assert_response :success
  end

  test "should get index" do
    get movie_comments_index_url
    assert_response :success
  end

  test "should get edit" do
    get movie_comments_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get movie_comments_destroy_url
    assert_response :success
  end

  test "should get create" do
    get movie_comments_create_url
    assert_response :success
  end

end
