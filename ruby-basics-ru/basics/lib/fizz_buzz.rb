# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if start > stop

  (start..stop).to_a.map do |n|
    next n.to_s unless fiz?(n) || buz?(n)

    result = ''
    result += 'Fizz' if fiz?(n)
    result += 'Buzz' if buz?(n)
    result
  end.join(' ')
end

def fiz?(number)
  (number % 3).zero?
end

def buz?(number)
  (number % 5).zero?
end
# END
