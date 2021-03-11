require "test_helper"

class DecimalAttributesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get decimal_attributes_new_url
    assert_response :success
  end

  test "should get create" do
    get decimal_attributes_create_url
    assert_response :success
  end

  test "should get edit" do
    get decimal_attributes_edit_url
    assert_response :success
  end

  test "should get update" do
    get decimal_attributes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get decimal_attributes_destroy_url
    assert_response :success
  end
end
