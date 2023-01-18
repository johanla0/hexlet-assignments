# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
  words = text.split
  replace_with = '$#%!'

  stop_words.each do |stop_word|
    words = words.map { |word| word != stop_word ? word : replace_with }
  end
  words.join(' ')
  # END
end
# rubocop:enable Style/For
