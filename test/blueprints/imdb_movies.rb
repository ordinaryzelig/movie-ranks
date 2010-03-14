Sham.title { Faker::Company.bs }

ImdbMovie.blueprint do
  title
  release_date { Date.today }
  imdb_id
end
