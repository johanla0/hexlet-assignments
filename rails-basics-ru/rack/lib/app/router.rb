# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    code = 200
    headers = { 'Content-Type' => 'text/plain' }

    case env['PATH_INFO']
    when '/'
      body = 'Hello, World!'
    when '/about'
      body = 'About page'
    else
      code = 404
      body = '404 Not Found'
    end

    [code, headers, [body]]
    # END
  end
end
