# frozen_string_literal: true

# BEGIN
def get_same_parity(array)
  return [] if array.empty?

  array.filter(&parity(array.first))
end

def parity(number)
  return :odd? if number.odd?

  :even?
end
# END
