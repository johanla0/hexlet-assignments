# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'net/http'

WebMock.allow_net_connect! if Rails.env.test?

class Hacker
  class << self
    def hack(email, password)
      hostname = 'https://rails-collective-blog-ru.hexlet.app'
      uri = URI.parse(hostname)
      get_path = '/users/sign_up'
      post_path = '/users'

      Net::HTTP.start(uri.host,
                      uri.port,
                      use_ssl: uri.scheme == 'https',
                      verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        request = Net::HTTP::Get.new uri.request_uri + get_path
        response = http.request request


        doc = Nokogiri::HTML(response.body)
        authenticity_token = doc.at('#new_user > input[type=hidden]')['value']

        cookie = response.response['set-cookie'].split('; ')[0]

        user = {
          email:,
          password:,
          password_confirmation: password
        }

        params = { authenticity_token:, user: }

        request = Net::HTTP::Post.new uri.request_uri + post_path
        request.body = URI.encode_www_form(params)
        request['Cookie'] = cookie


        http.request request
      end
    end
  end
end
