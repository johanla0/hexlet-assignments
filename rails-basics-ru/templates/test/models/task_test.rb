require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'valid task' do
    task = tasks(:one)
    assert task.valid?
  end

  test 'invalid without name' do
    task = Task.new(
      status: Faker::Hipster.word,
      creator: Faker::Book.author,
      completed: [true, false].sample
    )
    assert_not_nil task.errors[:name]
  end

  test 'invalid without creator' do
    task = Task.new(
      name: Faker::Book.title,
      status: Faker::Hipster.word,
      completed: [true, false].sample
    )
    assert_not_nil task.errors[:creator]
  end
end
