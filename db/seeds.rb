# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Destroy all previous data to avoid duplication when re-seeding
puts "Destroying all the existing comments and articles!"
Comment.destroy_all
Article.destroy_all

6.times do
  article = Article.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraphs(number: 5).join("\n\n"),
    category: Article.categories.keys.sample,
    summary: Faker::Quote.famous_last_words,
    tags: Faker::Lorem.words(number: 3).join(", "),
    publication_date: Faker::Date.between(from: 10.years.ago, to: Date.today),
    views: Faker::Number.between(from: 1, to: 1000)
  )

  # For each article, create a random number of comments (for this example, between 1 and 5 comments).
  rand(1..4).times do
    article.comments.create(
      content: Faker::Lorem.sentence(word_count: 10)
    )
  end
end

puts "6 Articles with associated comments created successfully 👌"
