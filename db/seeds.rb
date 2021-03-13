# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require 'faker'
require "open-uri"

puts 'cleaning the db...'
User.destroy_all
Chatroom.destroy_all
Badge.destroy_all
UserBadge.destroy_all
Booking.destroy_all

puts 'creating seeds for the team...'
User.create(email: 'federico@test.com', password: '123456', first_name: 'Federico', last_name: 'Valenza', username: 'fedeval', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
User.create(email: 'leonardo@test.com', password: '123456', first_name: 'Leonardo', last_name: 'Dacoreggio', username: 'dacoreggio', description: 'I’m an ops manager living the dream of coding learning journey. Lucky enough to work with the great Office Roulette team, building this beautiful app on which you can make new friends and just chill during your breaks.')
User.create(email: 'susann@test.com', password: '123456', first_name: 'Susann', last_name: 'Kachler', username: 'susann-dev', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
User.create(email: 'juan@test.com', password: '123456', first_name: 'Juan', last_name: 'Pao', username: 'juan-runs-code', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')

users = User.all
users.each do |user|
  file = URI.open("https://kitt.lewagon.com/placeholder/users/#{user.username}")
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end

puts 'creating seeds for the other users...'
hektor = User.create(email: 'hektor@test.com', password: '123456', first_name: 'Hektor', last_name: 'Hernandez', username: 'hekterminator', description: '...')
hektor.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Hektor.png')), filename: 'Hektor.png', content_type: 'image/png')

anett = User.create(email: 'anett@test.com', password: '123456', first_name: 'Anett', last_name: 'Logan', username: 'annie', description: '...')
anett.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Anett.png')), filename: 'Anett.png', content_type: 'image/png')

glendale = User.create(email: 'glendale@test.com', password: '123456', first_name: 'Glendale', last_name: 'Simons', username: 'grannieglen', description: '...')
glendale.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Glendale.png')), filename: 'Glendale.png', content_type: 'image/png')

holger = User.create(email: 'holger@test.com', password: '123456', first_name: 'Holger', last_name: 'Schneider', username: 'holger', description: '...')
holger.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Holger.png')), filename: 'Holger.png', content_type: 'image/png')

julia = User.create(email: 'julia@test.com', password: '123456', first_name: 'Julia', last_name: 'Jones', username: 'jayjay', description: '...')
julia.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Julia.png')), filename: 'Julia.png', content_type: 'image/png')

kim = User.create(email: 'kim@test.com', password: '123456', first_name: 'Kim', last_name: 'Kwang', username: 'kimk', description: '...')
kim.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Kim.png')), filename: 'Kim.png', content_type: 'image/png')

kristina = User.create(email: 'kristina@test.com', password: '123456', first_name: 'Kristina', last_name: 'Lopez', username: 'krissy', description: '...')
kristina.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Kristina.png')), filename: 'Kristina.png', content_type: 'image/png')

maria = User.create(email: 'maria@test.com', password: '123456', first_name: 'Maria', last_name: 'Bianchi', username: 'bellamaria', description: '...')
maria.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Maria.png')), filename: 'Maria.png', content_type: 'image/png')

pablo = User.create(email: 'pablo@test.com', password: '123456', first_name: 'Pablo', last_name: 'Gomez de la Fuente', username: 'pablito', description: '...')
pablo.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Pablo.png')), filename: 'Pablo.png', content_type: 'image/png')

sharona = User.create(email: 'sharona@test.com', password: '123456', first_name: 'Sharona', last_name: 'Lawson', username: 'mysharona', description: '...')
sharona.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Sharona.png')), filename: 'Sharona.png', content_type: 'image/png')

valentin = User.create(email: 'valentin@test.com', password: '123456', first_name: 'Valentin', last_name: 'Valentinowski', username: 'valthezar', description: '...')
valentin.photo.attach(io: File.open(File.join(Rails.root, '/app/assets/images/Valentin.png')), filename: 'Valentin.png', content_type: 'image/png')

# puts 'other user seeds...'
# 20.times do
#   other_user = User.create(email: Faker::Internet.email,
#               password: '123456',
#               first_name: Faker::Name.first_name,
#               last_name: Faker::Name.last_name,
#               username: Faker::Internet.username(specifier: 5..8),
#               description: Faker::Lorem.sentence(word_count: 20))
#   file = URI.open('https://thispersondoesnotexist.com/image')
#   other_user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# end

puts 'creating friensdhips'

HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Leonardo'), friendable: User.find_by(first_name: 'Juan'), status: "pending") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Juan'), friendable: User.find_by(first_name: 'Leonardo'), status: "requested") 

HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Leonardo'), friendable: User.find_by(first_name: 'Susann'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Leonardo'), friendable: User.find_by(first_name: 'Hektor'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Leonardo'), friendable: User.find_by(first_name: 'Anett'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Leonardo'), friendable: User.find_by(first_name: 'Maria'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Leonardo'), friendable: User.find_by(first_name: 'Valentin'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Susann'), friendable: User.find_by(first_name: 'Leonardo'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Hektor'), friendable: User.find_by(first_name: 'Leonardo'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Anett'), friendable: User.find_by(first_name: 'Leonardo'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Maria'), friendable: User.find_by(first_name: 'Leonardo'), status: "accepted") 
HasFriendship::Friendship.create(friend: User.find_by(first_name: 'Valentin'), friendable: User.find_by(first_name: 'Leonardo'), status: "accepted") 

puts 'creating badges'
Badge.create(category: 'funny', content: '😂')
Badge.create(category: 'party', content: '🥳')
Badge.create(category: 'nice', content: '🤗')
Badge.create(category: 'smart', content: '🧠')
Badge.create(category: 'geeky', content: '👾')

puts 'assigning badges to users excl. Leo'
badges = Badge.all
User.where.not(first_name: 'Leonardo').each do |receiver|
  User.where.not(first_name: 'Leonardo').each do |sender|
    unless  receiver == sender
      UserBadge.create(sender_id: sender.id,
                       receiver_id: receiver.id,
                       badge_id: badges.sample.id)
    end
  end
end

puts 'assigning badges to Leo'

def assign_badges(senders, receiver, badges, amount, category)
  amount.times do
    UserBadge.create(sender_id: senders.sample.id,
                     receiver_id: receiver.id,
                     badge_id: badges.find_by(category: category).id)
  end
end

senders = User.where.not(first_name: 'Leonardo')
leo = User.find_by(first_name: 'Leonardo')
assign_badges(senders, leo, badges, 8, 'funny')
assign_badges(senders, leo, badges, 7, 'party')
assign_badges(senders, leo, badges, 8, 'nice')
assign_badges(senders, leo, badges, 1, 'smart')
assign_badges(senders, leo, badges, 2, 'geeky')


puts 'creating some bookings'
hours = (9..19).to_a
minutes = (0..50).step(10).to_a

hours.each do |hour|
  minutes.each do |minute|
    start_time = Time.parse("#{hour}:#{minute}")
    Booking.create(start_time: start_time, user_one: User.where.not(first_name: 'Leonardo').sample) if (minute / 10) % [2,3,5].sample != 0
  end
end

Booking.create(start_time: Time.parse("17:20"), user_one: User.find_by(first_name: 'Federico'))
Booking.create(start_time: Time.parse("17:40"), user_one: User.find_by(first_name: 'Federico'))
Booking.create(start_time: Time.parse("18:00"), user_one: User.find_by(first_name: 'Federico'))

puts 'done.'
