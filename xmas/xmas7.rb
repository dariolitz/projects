puts "Breite:"
maxwidth = gets.to_f
maxwidth = maxwidth.round
maxwidth = maxwidth.to_i

height = maxwidth * 2 - 2

bowls = 50 * maxwidth/8
star = 1
space = maxwidth

elements = 0

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
end # obere spitze

puts elements

star = 1
space = maxwidth

while star <= maxwidth do
		space.times do
			print " "
		end
		star.times do
			if bowls > 0 
				print "0 "
				bowls -= 1
			else
				print "* "
			end
		end

		star -= 1
		space += 1

		if star >= 2
			puts
			space.times do
				print " "
			end
			star.times do
				print "* "
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