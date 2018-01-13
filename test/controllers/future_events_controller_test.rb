require 'test_helper'

class FutureEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get future_events_new_url
    assert_response :success
  end

  test "should get edit" do
    get future_events_edit_url
    assert_response :success
  end

  test "should get delete" do
    get future_events_delete_url
    assert_response :success
  end

end
