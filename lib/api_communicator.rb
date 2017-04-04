require 'rest-client'
require 'json'
require 'pry'

def call_api(url)
 json_str = RestClient.get(url)
 JSON.parse(json_str)
end

def get_character_movies_from_api(character)
 character_hash = call_api('http://www.swapi.co/api/people/')
 films_hash = []
 character_hash["results"].each do |data|
   binding.pry
   if data["name"].downcase == character
     data["films"].each {|url| films_hash.push(call_api(url))}
   end
 end
 films_hash
end

def parse_character_movies(films_hash)
 films_hash.each do |film|
   puts film["title"]
 end
end

def show_character_movies(character)
 films_hash = get_character_movies_from_api(character)
 parse_character_movies(films_hash)
end
