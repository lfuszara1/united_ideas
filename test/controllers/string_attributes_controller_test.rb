require "test_helper"

class StringAttributesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get string_attributes_new_url
    assert_response :success
  end

  test "should get create" do
    get string_attributes_create_url
    assert_response :success
  end

  test "should get edit" do
    get string_attributes_edit_url
    assert_response :success
  end

  test "should get update" do
    get string_attributes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get string_attributes_destroy_url
    assert_response :success
  end
end
