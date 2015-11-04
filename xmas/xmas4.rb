puts "Breite:"
maxwidth = gets.to_f
maxwidth = maxwidth.round
maxwidth = maxwidth.to_i

star = 1
space = maxwidth 
height = 0
while star <= maxwidth/3 do 
	space.times do
		print " "
	end
	star.times do 
		print "* "
	end

	star += 1
	space = space - 1
	puts
	height += 1
end # obere spitze

star = maxwidth/6
space = maxwidth - star + 1
while star <= maxwidth/2 do 
	space.times do
		print " "
	end
	star.times do 
		print "* "
	end
	star += 1
	space = space - 1
	puts
	height += 1
end # mittlere spitze

star = maxwidth/3
space = maxwidth - star + 1
while star <= maxwidth do 
	space.times do
		print " "
	end
	star.times do 
		print "* "
	end
	star += 1
	space = space - 1
	puts
	height += 1
end # untere spitze

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