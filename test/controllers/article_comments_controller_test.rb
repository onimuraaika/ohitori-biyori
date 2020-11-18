require 'test_helper'

class ArticleCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get article_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get article_comments_destroy_url
    assert_response :success
  end

end
