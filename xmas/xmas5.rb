puts "Breite:"
maxwidth = gets.to_f
maxwidth = maxwidth.round
maxwidth = maxwidth.to_i

height = 0

star = 1
space = maxwidth
while star <= maxwidth/1.5 do
	space.times do
		print " "
	end
	star.times do 
		print "* "
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
	height += 1
end # obere spitze

star = star / 2
space = maxwidth - star + 1
while star <= maxwidth/1.5 do 
	space.times do
		print " "
	end
	star.times do 
		print "* "
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
	height += 1
end # mittlere spitze

star = star / 2
space = maxwidth - star + 1
while star <= maxwidth do
	space.times do
		print " "
	end
	star.times do 
		print "* "
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
	height += 1
end #untere spitze

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