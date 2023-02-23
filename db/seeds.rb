# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

#   Character.create(name: "Luke", movie: movies.first)
2.times do |page| # Run the command for 10 times
  url = "https://api.themoviedb.org/3/movie/popular?api_key=bdc4ff49a44cc60aa8cbfae1805d5288&language=en-US&page=#{page+1}" # Replace YOUR_API_KEY with your actual API key
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)['results']

  movies.each do |movie|
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      rating: movie['vote_average'],
      poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
    )
    puts "created #{movie['title']}..."
  end
end
