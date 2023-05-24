# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do
  User.create(
    name: Faker::Book.author
  )
end

3.times do
  Status.create(
    name: Faker::Lorem.word
  )
end

2.times do
  Task.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    user: User.all.sample,
    status: Status.all.sample
  )
end
