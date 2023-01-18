# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, anagramms)
  anagramms.filter { |a| word.chars.tally == a.chars.tally }
end
# END
