# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new([1])
  end

  def test_push
    stack_size_before = @stack.size
    @stack.push!(1)
    assert { @stack.size == stack_size_before + 1 }
  end

  def test_pop
    stack_size_before = @stack.size
    @stack.pop!
    assert { @stack.size == stack_size_before - 1 }
  end

  def test_empty
    stack = Stack.new([])
    assert { stack.empty? == true }
  end

  def test_clear
    @stack.clear!
    assert { @stack.size.zero? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
