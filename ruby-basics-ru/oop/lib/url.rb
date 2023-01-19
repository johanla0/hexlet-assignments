# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable

  attr_accessor :uri
  attr_reader :params

  def initialize(uri = '')
    @uri = URI(uri)
    query = @uri.query.nil? ? '' : @uri.query
    @params = URI.decode_www_form(query).to_h.transform_keys(&:to_sym)
  end

  def_delegator :@uri, :scheme, :scheme
  def_delegator :@uri, :host, :host

  alias query_params params

  def query_param(key, default_value = nil)
    @params.fetch(key, default_value)
  end

  def ==(oth)
    @uri == URI(oth.uri)
  end
end
# END
