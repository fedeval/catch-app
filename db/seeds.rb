# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require 'faker'

puts 'cleaning the db...'
User.destroy_all

puts 'creating seeds for the team...'
User.create(email: 'federico@test.com', password: '123456', first_name: 'Federico', last_name: 'Valenza', username: 'fedeval', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
User.create(email: 'leonardo@test.com', password: '123456', first_name: 'Leonardo', last_name: 'Dacoreggio', username: 'dacoreggio', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
User.create(email: 'susann@test.com', password: '123456', first_name: 'Susann', last_name: 'Kachler', username: 'susann-dev', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
User.create(email: 'juan@test.com', password: '123456', first_name: 'Juan', last_name: 'Pao', username: 'juan-runs-code', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')

puts 'other user seeds...'
50.times do
  User.create(email: Faker::Internet.email,
              password: '123456',
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              username: Faker::Internet.username(specifier: 5..8),
              description: Faker::Lorem.sentence(word_count: 20))
end

puts 'creating chatroom'
Chatroom.create(name: 'general')

puts 'creating badges'
Badge.create(type: 'funny', content: 😂)
Badge.create(type: 'party', content: 🥳)
Badge.create(type: 'nice', content: 🤗)
Badge.create(type: 'smart', content: 🧠)
Badge.create(type: 'geeky', content: 👾)

badges = Badge.all
User.all.each do |receiver|
  User.all.each do |sender|
    UserBadge.create(sender_id: sender.id,
                     receiver_id: receiver.id, 
                     badge_id: badges.sample.id)
  end
end

puts 'done.'
