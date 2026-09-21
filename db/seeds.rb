# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

users = [
  { name: "Michael Hartl", email: "michael@example.com" },
  { name: "Ada Lovelace", email: "ada@example.com" },
  { name: "Alan Turing", email: "alan@example.com" }
].map { |attrs| User.find_or_create_by!(email: attrs[:email]) { |u| u.name = attrs[:name] } }

microposts = [
  "First micropost!",
  "Learning Rails with the toy app.",
  "Users and microposts, has_many/belongs_to in action.",
  "Validations keep the data honest.",
  "Almost lunchtime."
]

users.each do |user|
  microposts.each do |content|
    user.microposts.find_or_create_by!(content: content)
  end
end

puts "Seeded #{User.count} users and #{Micropost.count} microposts."
