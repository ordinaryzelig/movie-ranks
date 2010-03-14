require 'rubygems'
require 'imdb'

def output(movie)
  imdb_movie = Imdb.find_movie_by_id(movie[:imdb_id])
  movie[:year] = imdb_movie.release_date.year
  puts movie.inspect
end

titles = File.read(__FILE__).split(/__END__[\r\n]/).last.split(/[\r\n]/)
titles.each do |title|
  next if title =~ /^#/
  # rewrite this using Movie.search_imdb(title).
  movies = Imdb.search_movies_by_title(title)
  case movies
  when Array
    case movies.size
    when 0
      puts "nothing found for #{title}"
    else
      output movies.first
    end
  when Hash
    output movies
  end
end

__END__
Ace Ventura Pet Detective
After the Wedding
All About Eve
Almost Famous
Along Came Polly
American Beauty
Annie Hall
Army of Darkness
Babel
Batman Begins
Bedazzled
The Believer
The Birdcage
Borat
Broken Arrow
Cabin Boy
Catch Me If You Can
The Cell
Coming to America
The Dark Knight
Demolition Man
Dogma
Dumb and Dumber
Encino Man
Eternal Sunshine of the Spotless Mind
Eurotrip
Fargo
Ferris Buelers Day Off
Final Fantasy - The Spirits Within
Finding Nemo
Forest Gump
Forgetting Sarah Marshall
The Freshman
The Good Girl
The Grand
Greedy
Gung Ho
Hackers
Half Nelson
He's Just Not That Into You
High Fidelity
The Hitchhiker's Guide to the Galaxy
Hotel Rwanda
The Hudsucker Proxy
Ice Age
Ice Age 2
The Incredibles
Julia
Juno
Just Friends
Knocked Up
Kung Fu Panda
L.A. Story
Lady in the Water
Lars and the Real Girl
The Little Mermaid
Little Miss Sunshine
The Lord of the Rings: The Fellowship of the Ring
The Lord of the Rings: The Return of the King
The Lord of the Rings: The Two Towers
Lost In Translation
Madagascar
Major League
Matchstick Men
The Matrix
The Matrix Reloaded
The Matrix Revolutions
Mixed Nuts
Monsters, Inc.
Multiplicity
My Big Fat Greek Wedding
My Cousin Vinny
Nothing to Lose
Ocean's Eleven
Office Space
Old School
Once
The Original Kings of Comedy
Oscar
The Paper
Pi
Pirates of the Carribean: The Curse of the Black Pearl
The Princess Bride
The Red Violin
The Ref
Requiem for a Dream
Reservoir Dogs
Road to Perdition
Road Trip
Robin Hood: Men in Tights
Role Models
The Royal Tenenbaums
Scent of a Woman
School of Rock
The Secret Life of Mrs. Beeton
Seven
Sideways
Son in Law
Spaceballs
Spanglish
Sweeney Todd
Theres Something About Mary
Tropic Thunder
Underworld
V for Vendetta
Waitress
Wall-e
Wedding Crashers
What about Bob
What's Eating Gilbert Grape
When Harry Met Sally
Without a Clue
Zelig
