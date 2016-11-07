require 'rspotify'

RSpotify.authenticate("34f62c6d0da248f18b5a1b9674b61ec9","c2344d5fb5ca4026b5aaef443763f528")

me = RSpotify::User.find('11134525102')
me.playlists.each {|playlist| puts playlist.name }