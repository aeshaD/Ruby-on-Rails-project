require 'test_helper'

class IcategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get icategories_index_url
    assert_response :success
  end

  test "should get new" do
    get icategories_new_url
    assert_response :success
  end

  test "should get edit" do
    get icategories_edit_url
    assert_response :success
  end

end
