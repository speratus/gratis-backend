# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Shoutout.destroy_all

puts "Creating users"
20.times do
    User.create(name: Faker::Name.name, 
        username: Faker::Hipster.words(number: 1).join(' '),
        password: 'helloworld',
        tagline: Faker::Hipster.words(number: 5).join(' '),
        bio: Faker::Hipster.paragraph,
        email: Faker::Internet.email
    )
end
puts "Users created"

puts "Creating Shoutouts"
30.times do
    Shoutout.create(
        content: Faker::Hipster.words(number: 6).join(' '),
        user_id: User.all.sample.id,
        visibility: ['friends', 'public'].sample
    )
end
puts "Shoutouts created"