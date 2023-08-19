# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  setup do
    @repo = repositories :one

    @attrs = {
      link: 'https://github.com/octocat/Hello-World'
    }
  end

  test 'get index' do
    get repositories_path
    assert_response :success
  end

  test 'get new' do
    get new_repository_path
    assert_response :success
  end

  test 'should create' do
    response = load_fixture('files/response.json')

    uri_template = Addressable::Template.new 'https://api.github.com/repos/{user}/{repo}'
    stub_request(:get, uri_template)
      .to_return(
        status: 200,
        body: response,
        headers: { content_type: 'application/json' }
      )

    post repositories_path, params: { repository: @attrs }

    repository = Repository.find_by @attrs

    assert { repository }
    assert { repository.description.present? }
    assert_redirected_to repository_path(repository)
  end

  test 'get edit' do
    get edit_repository_path(@repo)
    assert_response :success
  end

  test 'should update' do
    patch repository_path(@repo), params: { repository: @attrs }

    @repo.reload

    assert { @repo.link == @attrs[:link] }
    assert_redirected_to repositories_path
  end

  test 'destroy' do
    delete repository_path(@repo)

    assert { !Repository.exists? @repo.id }

    assert_redirected_to repositories_path
  end
  # END
end
