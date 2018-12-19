require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "models/MagicalCreature.rb"

set :bind, '0.0.0.0'  # bind to all interfaces

# The MAGICAL_CREATURES variable is an array of hashes, and can be accessed from an of your routes.
MAGICAL_CREATURES = [
  {
    name: "unicorn",
    ability: "Its horn is said to have the power to render poisoned water potable and heal sickness.",
    age: 140
  },
  {
    name: "dragon",
    ability: "Breathes fire and has a hide of scales that is near impenetrable.",
    age: 587
  },
  {
    name: "phoenix",
    ability: "When it is old and weary, its body ignites in flame and it arises anew from the ashes of its predecessor.",
    age: nil
  }
]

# You may define your routes here. Start with the root path, and designate an appropriately named erb template!

get '/' do
  erb :home
end

get '/creatures' do
  @creatures = []
  MAGICAL_CREATURES.each do |creature|
    @creatures << MagicalCreature.new(creature[:name], creature[:ability], creature[:age])
  end
  erb :index
end

get '/creature/unicorn' do
  @creature = MAGICAL_CREATURES[0]
  erb :show
end

get '/creature/dragon' do
  binding.pry
  @creature = MAGICAL_CREATURES[1]
  erb :show
end

get '/creature/phoenix' do
  @creature = MAGICAL_CREATURES[2]
  erb :show
end
