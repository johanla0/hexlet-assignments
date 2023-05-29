require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  test 'valid comment' do
    comment = post_comments(:one)
    assert comment.valid?
  end

  test 'invalid without body' do
    comment = PostComment.create(post: posts(:one))
    assert_not_nil comment.errors[:body]
  end

  test 'invalid without post' do
    comment = PostComment.create(
      body: Faker::Hipster.word
    )
    assert_not_nil comment.errors[:post]
  end
end
