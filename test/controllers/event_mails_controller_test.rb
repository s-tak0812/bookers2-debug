require "test_helper"

class EventMailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_mails_index_url
    assert_response :success
  end

  test "should get new" do
    get event_mails_new_url
    assert_response :success
  end

  test "should get show" do
    get event_mails_show_url
    assert_response :success
  end
end
