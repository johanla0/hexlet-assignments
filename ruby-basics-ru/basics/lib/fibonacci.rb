# frozen_string_literal: true

# BEGIN
def fibonacci(index, memo = [])
  return nil if index.negative?

  return 0 if index.zero?

  return 1 if index <= 2

  memo[index] = fibonacci(index - 1, memo) + fibonacci(index - 2, memo) if memo[index].nil?
  memo[index]
end
# END
