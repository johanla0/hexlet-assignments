require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'valid task' do
    task = tasks(:one)
    assert task.valid?
  end

  test 'invalid without user' do
    task = Task.new(
      name: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      status: statuses(:one)
    )
    assert_not_nil task.errors[:user]
  end

  test 'invalid without status' do
    task = Task.new(
      name: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      user: users(:one)
    )
    assert_not_nil task.errors[:status]
  end
end
