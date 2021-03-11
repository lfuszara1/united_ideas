require "test_helper"

class AttributesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get attributes_new_url
    assert_response :success
  end

  test "should get create" do
    get attributes_create_url
    assert_response :success
  end

  test "should get edit" do
    get attributes_edit_url
    assert_response :success
  end

  test "should get update" do
    get attributes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get attributes_destroy_url
    assert_response :success
  end
end
