# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable

  attr_accessor :uri
  attr_reader :params

  def_delegators :@uri, :to_s, :host, :scheme
  alias query_params params

  def initialize(uri = '')
    @uri = URI(uri)
    query = @uri.query.nil? ? '' : @uri.query
    @params = URI.decode_www_form(query).to_h.transform_keys(&:to_sym)
  end

  def query_param(key, default_value = nil)
    @params.fetch(key, default_value)
  end

  def <=>(oth)
    @uri.to_s <=> oth.to_s
  end
end
# END
