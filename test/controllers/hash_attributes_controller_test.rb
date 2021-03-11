require "test_helper"

class HashAttributesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hash_attributes_new_url
    assert_response :success
  end

  test "should get create" do
    get hash_attributes_create_url
    assert_response :success
  end

  test "should get edit" do
    get hash_attributes_edit_url
    assert_response :success
  end

  test "should get update" do
    get hash_attributes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hash_attributes_destroy_url
    assert_response :success
  end
end
