# frozen_string_literal: true

# BEGIN
class Integer
  def fizz_buzz
    return_word_if_divisible = ->(n, w, num) { (num % n).zero? ? w : '' }

    fizz = return_word_if_divisible.curry.call(3, 'Fizz')
    buzz = return_word_if_divisible.curry.call(5, 'Buzz')

    result = ''
    result += fizz.call(self)
    result += buzz.call(self)
    result.empty? ? self : result
  end
end

def fizz_buzz(start, stop)
  return nil if start > stop

  (start..stop).to_a.map(&:fizz_buzz).join(' ')
end
# END
