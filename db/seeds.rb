# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


genre_names = %w{Action Adventure Animation Biography Comedy Crime Documentary Drama Family Fantasy Film-Noir Game-Show History Horror Music Musical Mystery News Reality-TV Romance Sci-Fi Sport Talk-Show Thriller War Western}

genre_names.each do |genre_name|
  genre = Genre.create!(name: genre_name)

  10.times do |index|
    Video.create!(genre: genre_name, title: "Video #{index}")
  end
end
