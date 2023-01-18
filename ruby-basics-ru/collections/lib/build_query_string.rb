# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  query_strings = []
  params.sort.each do |k, v|
    query_strings << "#{k}=#{v}"
  end
  query_strings.join('&')
end
# END
# rubocop:enable Style/For
