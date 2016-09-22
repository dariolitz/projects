require 'koala'

@graph = Koala::Facebook::API.new("EAACEdEose0cBAPl4w6F4lZBfPOhWHTnlH8fD9GLVYQkniPistGKwmeDQfOqmItZAYgO5RBIW9FTu9EWsSnKqLUGJJGSei4Nw9uLJZCamD4vqmRYiOXIpiyWmiYstxcz1N2r2UzQFR2x2kBHVKfdmAVENGfKb8aVnOD0RBxQGgZDZD")

profile = @graph.get_object("me")
friends = @graph.get_connections("me", "friends")

puts @graph.methods