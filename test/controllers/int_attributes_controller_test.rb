require "test_helper"

class IntAttributesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get int_attributes_new_url
    assert_response :success
  end

  test "should get create" do
    get int_attributes_create_url
    assert_response :success
  end

  test "should get edit" do
    get int_attributes_edit_url
    assert_response :success
  end

  test "should get update" do
    get int_attributes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get int_attributes_destroy_url
    assert_response :success
  end
end
