require 'test_helper'

class RequestThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_theme = request_themes(:one)
  end

  test "should get index" do
    get request_themes_url
    assert_response :success
  end

  test "should get new" do
    get new_request_theme_url
    assert_response :success
  end

  test "should create request_theme" do
    assert_difference('RequestTheme.count') do
      post request_themes_url, params: { request_theme: { name: @request_theme.name, title: @request_theme.title } }
    end

    assert_redirected_to request_theme_url(RequestTheme.last)
  end

  test "should show request_theme" do
    get request_theme_url(@request_theme)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_theme_url(@request_theme)
    assert_response :success
  end

  test "should update request_theme" do
    patch request_theme_url(@request_theme), params: { request_theme: { name: @request_theme.name, title: @request_theme.title } }
    assert_redirected_to request_theme_url(@request_theme)
  end

  test "should destroy request_theme" do
    assert_difference('RequestTheme.count', -1) do
      delete request_theme_url(@request_theme)
    end

    assert_redirected_to request_themes_url
  end
end
