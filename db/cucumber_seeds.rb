# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.destroy_all
Genre.destroy_all

User.each do |u|
  u.video_views.destroy_all
end

genre_names = %w{Action Adventure Animation Biography Comedy Crime Documentary Drama Family Fantasy Film-Noir Game-Show History Horror Music Musical Mystery News Reality-TV Romance Sci-Fi Sport Talk-Show Thriller War Western}

genre_names.each do |genre_name|
  genre = Genre.create!(name: genre_name)

  100.times do |index|
    Video.create!(genre: genre_name, title: "Video #{index}", colour: "%06x" % (rand * 0xffffff))
  end
end
