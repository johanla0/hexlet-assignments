# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'net/https'

class Hacker
  ROOT_PATH = 'https://rails-collective-blog-ru.hexlet.app'
  GET_PATH = '/users/sign_up'
  POST_PATH = '/users'

  class << self
    def hack(email, password)
      uri = URI.parse(ROOT_PATH)

      Net::HTTP.start(uri.host,
                      uri.port,
                      use_ssl: uri.scheme == 'https',
                      verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        request = Net::HTTP::Get.new uri.request_uri + GET_PATH
        response = http.request request

        doc = Nokogiri::HTML(response.body)
        authenticity_token = doc.at('meta[name="csrf-token"]')['content']

        cookie = response.response['set-cookie'].split('; ')[0]

        user = {
          email:,
          password:,
          password_confirmation: password
        }

        params = { authenticity_token:, user: }

        request = Net::HTTP::Post.new uri.request_uri + POST_PATH
        request.body = URI.encode_www_form(params)
        request['Cookie'] = cookie

        response = http.request request

        # puts response.code
      end
    end
  end
end
