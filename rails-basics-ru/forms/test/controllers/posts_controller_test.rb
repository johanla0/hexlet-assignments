# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)

    @attrs = {
      title: Faker::Movies::VForVendetta.character,
      body: Faker::Movies::VForVendetta.speech,
      published: Faker::Boolean.boolean,
      summary: Faker::Movies::VForVendetta.quote
    }
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should get new' do
    get new_post_path
    assert_response :success
  end

  test 'should create post' do
    post posts_path, params: { post: @attrs }

    post = Post.find_by(@attrs)

    assert { post }
    assert_redirected_to post_path(post)
  end

  test 'should show post' do
    get post_path(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_path(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_path(@post), params: { post: @attrs }

    @post.reload

    assert { @post.title == @attrs[:title] }
    assert_redirected_to post_path(@post)
  end

  test 'should destroy post' do
    delete post_path(@post)

    assert { !Post.exists? @post.id }

    assert_redirected_to root_path
  end
end
