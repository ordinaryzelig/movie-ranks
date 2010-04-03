Sham.movie_title { Faker::Company.bs }
Sham.year { [19, 20].rand.to_s + rand(99).to_s.rjust(2, '0') }
Sham.imdb_id { "tt#{rand(10000)}" }

Movie.blueprint do
  title { Sham.movie_title }
  imdb_id
  year
end

Movie.blueprint(:zelig) do
  title { 'Zelig' }
  imdb_id { Movie::Zelig_imdb_id }
  year { 1983 }
end

class Movie
  
  Zelig_imdb_id = 'tt0086637'
  
end
