require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
  end

  test 'should create post_comment' do
    assert_difference('PostComment.count') do
      post comments_path, params: { post_comment: { body: @comment.body, post_id: posts(:one).id } }
    end

    assert_redirected_to post_path(PostComment.last.post)
  end

  test 'should get edit' do
    get edit_comment_path(@comment)
    assert_response :success
  end

  test 'should update post_comment' do
    patch comment_path(@comment), params: { post_comment: { body: 'Edited text' } }
    assert_redirected_to post_path(@comment.post)
  end

  test 'should destroy post_comment' do
    assert_difference('PostComment.count', -1) do
      delete comment_path(@comment)
    end

    assert_redirected_to post_path(@comment.post)
  end
end
