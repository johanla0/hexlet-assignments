require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'valid post' do
    post = posts(:one)
    assert post.valid?
  end

  test 'invalid without title' do
    post = Post.create
    assert_not_nil post.errors[:title]
  end
end
