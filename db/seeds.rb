require 'faker'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
100.times do |i|
  blog_post = BlogPost.where(title: "blog post #{i}").first_or_initialize
  blog_post.update(content: "Hello world", published_at: Time.current)
end
def faker_name
  Faker::Internet.username(specifier: 5..12) # or combine Faker::Game.title etc.
end
if CheatReport.count < 120
100.times do |i|
CheatReport.create(
  player_name: "#{faker_name}",
  description: "This is a test report",
  status: rand(7),
  reported_by: "#{faker_name}",
  voted_as_true: rand(0),
  voted_as_false: rand(100),
  voted_as_true_by: "#{faker_name}",
  voted_as_false_by: "#{faker_name}",
  steam_url: "https://steamcommunity.com/profiles/76561199219934080/"
)
end
end