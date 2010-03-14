Movie.blueprint do
  title
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
