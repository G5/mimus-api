require 'test_helper'

class JsonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get json_index_url
    assert_response :success
  end

  test "should get new" do
    get json_new_url
    assert_response :success
  end

  test "should get view" do
    get json_view_url
    assert_response :success
  end

end
