require 'faker'

hobbes = User.create!(
  username: 'Hobbes',
  email: 'hobbes@example.com',
  password: 'foobar',
  confirmed_at: Time.zone.now
)


5.times do
  User.create!(
    username: Faker::Superhero.name,
    email: Faker::Internet.safe_email,
    password: "foobar",
    password_confirmation: "foobar",
    confirmed_at: Time.zone.now
  )
end
users = User.all

10.times do
  Topic.create!(
    user: users.sample,
    title: Faker::Lorem.sentence(3)
  )
end
topics = Topic.all

50.times do
  Bookmark.create!(
    topic: topics.sample,
    user: users.sample,
    url: Faker::Internet.url
  )
end

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
