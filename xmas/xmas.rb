maxwidth = gets.to_i
star = 1
space = maxwidth/2 
height = 0

while star <= maxwidth do 
	space.times do
		print " "
	end
	star.times do 
		print "*"
	end
	star += 2
	space = space - 1
	puts
	height += 1
end

(height/5).times do
	((maxwidth-maxwidth/5)/2).times do 
		print " "
	end
	(maxwidth/5).times do
		print "*"
	end
	puts
end