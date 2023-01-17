# frozen_string_literal: true

# BEGIN
def reverse(str)
  result = []
  str.each_char { |c| result.unshift(c) }
  result.join
end
# END
