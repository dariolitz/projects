puts "Breite:"
maxwidth = gets.to_f
maxwidth = maxwidth.round
maxwidth = maxwidth.to_i

height = 0

bowls = 50 * maxwidth/8
star = 1
space = maxwidth
i = 0
while star <= maxwidth/1.5 do
		space.times do
			print " "
		end
		star.times do
			zufall = Random.new
			zufall = zufall.rand(0..4)
			if zufall == 4 && i < bowls
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
			height += 1
		end

		star += 2
		space -= 2
		puts
		height += 1
end # obere spitze

height = (height/5.0).round
height.times do
	print " "
	((maxwidth-maxwidth/5)).times do 
		print " "
	end
	(maxwidth/5).times do
		print "* "
	end
	puts
end # Stamm

puts height*5