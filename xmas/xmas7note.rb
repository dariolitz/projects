puts "Breite:"
maxwidth = gets.to_f
maxwidth = maxwidth.round
maxwidth = maxwidth.to_i

height = maxwidth * 2 - 2

puts height

elements = 0

star = 1
space = maxwidth

while star <= maxwidth do
		star.times do
				elements += 1
		end

		star -= 1
		space += 1
		if star >= 2
			star.times do
				elements += 1
			end
		end

		star += 2
		space -= 2
end

puts "#{elements} Plaetze vorhanden"
puts "Anzahl Kugeln:"
bowls = gets.chomp.to_i

if bowls > elements
	puts "Zu viele Kugeln!"
else

	intervall = elements / bowls
	puts intervall
	intervallcounter = 0

	star = 1
	space = maxwidth

	while star <= maxwidth do
			space.times do
				print " "
			end
			star.times do
				if bowls > 0 && intervallcounter % intervall == 0
					print "0 "
					bowls -= 1
				else
					print "* "
				end
				intervallcounter += 1
			end

			star -= 1
			space += 1
			if star >= 2
				puts
				space.times do
					print " "
				end
				star.times do
					if bowls > 0 && intervallcounter % intervall == 0
						print "0 "
						bowls -= 1
					else
						print "* "
					end
					intervallcounter += 1
				end
			end

			star += 2
			space -= 2
			puts
	end # obere spitze

	base = (height/5.0).round
	base.times do
		print " "
		((maxwidth-maxwidth/5)).times do 
			print " "
		end
		(maxwidth/5).times do
			print "* "
		end
		puts
	end # Stamm

	puts height
	puts elements
end

