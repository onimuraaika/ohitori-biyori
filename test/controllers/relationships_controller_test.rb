require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get following" do
    get relationships_following_url
    assert_response :success
  end

  test "should get follow" do
    get relationships_follow_url
    assert_response :success
  end

  test "should get unfollow" do
    get relationships_unfollow_url
    assert_response :success
  end

end
