def spin(chambers) # Kammern drehen
	chambers = [0,0,0,0,0,0] # alle Kammern leeren
	random = Random.new
	random = random.rand(6)
	chambers[random] = 1 # Kugel in zufällige Kammer
	return chambers
end

def trigger(chambers, players)
	i = 0
	p = 0
	while i < 6
		if p == players.length
			p = 0
		end
		current_player = players[p]
		puts "#{current_player.name}s turn"
		puts "Shoot(j) or Spin(k)"
		desicion = gets.chomp
		if desicion == "j"
			if chambers[i] == 1
				puts "BOOOM!"
				puts "#{current_player.name} is dead"
				i += 1
				p += 1
				break
			else
				puts "KLICK!"
				i += 1
				p += 1
				current_player = players[p]
			end
		elsif desicion == "k"
			puts "spinning..."
			chambers = spin(chambers)
			i = 0
			if chambers[i] == 1
				puts "BOOOM!"
				puts "#{current_player.name} is dead"
				i += 1
				p += 1
				break
			else
				puts "KLICK!"
				i += 1
				p += 1
				current_player = players[p]
			end
		end
	end
end

class Player

	attr_accessor :name

	def initialize(name)
		@name = name
	end

end

player1 = Player.new("John")
player2 = Player.new("Jim")
player3 = Player.new("Will")
player4 = Player.new("Quentin")
player5 = Player.new("Michael")
player6 = Player.new("Django")

players = ObjectSpace.each_object(Player).to_a

chambers = []

spinned_chambers = spin(chambers)

trigger(spinned_chambers, players)
