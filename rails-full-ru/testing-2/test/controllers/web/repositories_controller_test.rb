# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create' do
    response = load_fixture('files/response.json')
    uri_template = Addressable::Template.new 'https://api.github.com/repos/{user}/{repo}'
    stub_request(:get, uri_template)
      .to_return(
        body: response,
        headers: { content_type: 'application/json' },
        status: 200
      )
    assert_difference 'Repository.count' do
      post repositories_path, params: { repository: { link: 'https://github.com/octocat/Hello-World' } }
    end
  end
  # END
end
