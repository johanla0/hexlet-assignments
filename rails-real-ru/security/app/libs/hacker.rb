# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'net/http'

class Hacker
  class << self
    def hack(email, password)
      hostname = 'https://rails-collective-blog-ru.hexlet.app/'
      get_path = 'users/sign_up'
      post_path = 'users'

      uri = URI.parse(hostname)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new uri.request_uri + get_path
      response = http.request request

      doc = Nokogiri::HTML(response.body)
      authenticity_token = doc.at('input[name="authenticity_token"]')['value']

      cookie = response.response['set-cookie'].split('; ')[0]

      params = {
        'user[email]': email,
        'user[password]': password,
        'user[password_confirmation]': password,
        authenticity_token:
      }

      request = Net::HTTP::Post.new uri.request_uri + post_path
      request.body = URI.encode_www_form(params)
      request['Cookie'] = cookie

      http.request request
    end
  end
end
