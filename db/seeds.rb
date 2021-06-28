require 'faker'
require "open-uri"

puts 'cleaning the db...'
User.destroy_all
Chatroom.destroy_all
Badge.destroy_all
UserBadge.destroy_all
Booking.destroy_all

# puts 'creating seeds for the team...'
# User.create(email: 'federico@test.com', password: '123456', first_name: 'Federico', last_name: 'Valenza', username: 'fedeval', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
# User.create(email: 'leonardo@test.com', password: '123456', first_name: 'Leonardo', last_name: 'Dacoreggio', username: 'dacoreggio', description: 'I’m an ops manager living the dream of coding learning journey. Lucky enough to work with the great Office Roulette team, building this beautiful app on which you can make new friends and just chill during your breaks.')
# User.create(email: 'susann@test.com', password: '123456', first_name: 'Susann', last_name: 'Kachler', username: 'susann-dev', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
# User.create(email: 'juan@test.com', password: '123456', first_name: 'Juan', last_name: 'Pao', username: 'juan-runs-code', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
# users = User.all
# users.each do |user|
#   file = URI.open("https://kitt.lewagon.com/placeholder/users/#{user.username}")
#   user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# end

puts 'creating seeds for the other users...'

users_placeholders = ['Hektor', 'Anett', 'Glendale', 'Holger', 'Julia', 'Kim', 'Kristina', 'Maria', 'Pablo', 'Sharona', 'Valentin']

users_placeholders.each do |name|
  new_user = User.create(email: "#{name.downcase}@test.com", password: Faker::Internet.password, first_name: "#{name}", last_name: Faker::Name.last_name, username: Faker::Internet.username(specifier: "#{name}"), description: Faker::Lorem.paragraph(sentence_count: 4))
  new_user.photo.attach(io: File.open(File.join(Rails.root, "/app/assets/images/#{name}.png")), filename: "#{name}.png", content_type: 'image/png')
end

puts 'creating friensdhips'

User.all.each do |friend|
  User.all.each do |friendable|
    unless  friend == friendable
      HasFriendship::Friendship.create(
        friend: friend,
        friendable: friendable,
        status: ['pending', 'requested', 'accepted'].sample
      )
    end
  end
end

puts 'creating badges'
Badge.create(category: 'funny', content: '😂')
Badge.create(category: 'party', content: '🥳')
Badge.create(category: 'nice', content: '🤗')
Badge.create(category: 'smart', content: '🧠')
Badge.create(category: 'geeky', content: '👾')

puts 'assigning random badges to users'
badges = Badge.all
User.all.each do |receiver|
  User.all.each do |sender|
    unless  receiver == sender
      UserBadge.create(sender_id: sender.id,
                       receiver_id: receiver.id,
                       badge_id: badges.sample.id)
    end
  end
end

puts 'creating some bookings'
hours = (9..18).to_a
minutes = (0..50).step(10).to_a

hours.each do |hour|
  minutes.each do |minute|
    start_time = Time.parse("#{hour}:#{minute}")
    Booking.create(start_time: start_time, user_one: User.all.sample) if (minute / 10) % [2,3,5].sample != 0
  end
end

puts 'done.'
