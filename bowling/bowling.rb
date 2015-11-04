class Player
	attr_writer :score
	attr_reader :name, :score

	@@instance_collector = []
	def initialize(name)
		if @@instance_collector.length < 100 
			@@instance_collector << self
			@name = name
			@score = 0
		else
			puts "Zu viele Spieler!"
		end
	end

	def roll
		result = Random.new
		result = result.rand(11)
		self.score = self.score + result
		if result == 10
			self.roll
		end
	end
end

def round
	ObjectSpace.each_object Player do |player|
		10.times do 
			player.roll
		end
		puts "#{player.name.chomp}:\t#{player.score}"
	end
end

puts "Wie viele Spieler?"
number_of_players = gets

puts "Bitte Namen der Spieler eingeben!"
(number_of_players.to_i).times do |i|
	i = Player.new(gets)
end

puts "Wie viele Runden soll gespielt werden?"
runden = gets
(runden.to_i).times do
	round
end
