puts "Breite:"
maxwidth = gets.to_f
maxwidth = maxwidth.round
maxwidth = maxwidth.to_i
star = 1
space = maxwidth/2 
height = 0

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
end

 height = (height/5.0).round

height.times do
	((maxwidth-maxwidth/5)/2).times do 
		print " "
	end
	if (maxwidth/5).even?
		(maxwidth/5 + 1).times do
			print "*"
		end
	else 
		(maxwidth/5).times do
			print "*"
		end
	end
	puts
end