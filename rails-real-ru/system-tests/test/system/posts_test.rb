# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test 'visiting #index' do
    visit posts_path

    assert_selector '.table'
    assert_selector 'th', text: 'Title'
  end

  test 'visiting #show' do
    visit post_path(@post)

    assert_selector 'p', text: @post.body
  end

  test 'visiting #new' do
    visit new_post_path

    assert_text 'New post'
    assert_selector 'form'
  end

  test 'visiting #edit' do
    visit edit_post_path(@post)

    assert_text 'Editing post'
  end

  test 'perform #create' do
    visit new_post_path

    within('form') do
      fill_in 'Title', with: Faker::Lorem.word
      fill_in 'Body', with: Faker::Lorem.paragraph
      find('input[type="submit"]').click
    end

    assert_text 'Post was successfully created'
  end

  test 'perform #update' do
    visit edit_post_path(@post)

    within('form') do
      fill_in 'Title', with: Faker::Lorem.word
      fill_in 'Body', with: Faker::Lorem.paragraph
      find('input[type="submit"]').click
    end

    assert_text 'Post was successfully updated'
  end

  test 'perform #destroy' do
    visit posts_path
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end
# END
