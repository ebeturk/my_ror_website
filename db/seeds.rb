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

puts "Now it's time to generate some music 🎸"

# db/seeds.rb

# Clear existing records (optional)
Music.destroy_all

# Seed data
musics = [
  {
    title: 'Song 1',
    description: 'A cool song number 1',
    music_type: 'song',
    genre: 'rock',
    url: 'https://www.youtube.com/watch?v=X40Cj_flKkc',
    release_date: '2022-01-01',
    album: 'Album A',
    artist: 'Artist A',
    lyrics: 'Lorem ipsum lyrics for song 1...'
  },
  {
    title: 'Song 2',
    description: 'A cool song number 2',
    music_type: 'song',
    genre: 'pop',
    url: 'https://res.cloudinary.com/dzk0qfl8v/video/upload/v1693213211/efendisiz-anka_online-audio-converter.com_pwoezy.mp3',
    release_date: '2022-02-01',
    album: 'Album B',
    artist: 'Artist B',
    lyrics: 'Lorem ipsum lyrics for song 2...'
  },
  {
    title: 'Song 3',
    description: 'A cool song number 3',
    music_type: 'song',
    genre: 'jazz',
    url: 'https://res.cloudinary.com/dzk0qfl8v/video/upload/v1693213211/efendisiz-anka_online-audio-converter.com_pwoezy.mp3',
    release_date: '2022-03-01',
    album: 'Album C',
    artist: 'Artist C',
    lyrics: 'Lorem ipsum lyrics for song 3...'
  },
  {
    title: 'Song 4',
    description: 'A cool song number 4',
    music_type: 'song',
    genre: 'classical',
    url: 'https://res.cloudinary.com/dzk0qfl8v/video/upload/v1693213211/efendisiz-anka_online-audio-converter.com_pwoezy.mp3',
    release_date: '2022-04-01',
    album: 'Album D',
    artist: 'Artist D',
    lyrics: 'Lorem ipsum lyrics for song 4...'
  },
  {
    title: 'Snippet 1',
    description: 'A cool snippet number 1',
    music_type: 'snippet',
    genre: 'rock',
    url: 'https://example.com/snippet1.mp3',
    release_date: '2022-05-01',
    artist: 'Artist E',
    lyrics: 'Lorem ipsum lyrics for snippet 1...'
  },
  {
    title: 'Snippet 2',
    description: 'A cool snippet number 2',
    music_type: 'snippet',
    genre: 'jazz',
    url: 'https://example.com/snippet2.mp3',
    release_date: '2022-06-01',
    artist: 'Artist F',
    lyrics: 'Lorem ipsum lyrics for snippet 2...'
  }
]

# Create records
musics.each do |music|
  Music.create!(music)
end

puts "Seeded #{Music.count} music records!"
