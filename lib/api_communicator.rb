require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character_data = character_hash["results"].find { |data| data["name"] == character }
  film_urls = character_data["films"]
  film_data = film_urls.collect { |data| JSON.parse(RestClient.get(data)) }
  film_data

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  # films_hash = get_character_movies_from_api("Luke Skywalker")
  films_hash.each.with_index(1) do |data, index|
    puts "#{index} " + data['title']
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  print_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
