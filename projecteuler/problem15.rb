def grid(x,y)
	sleep(0.5)
	if x <= 20 && y <= 20
		if x <= 20
			puts "X: #{x}"
			grid(x + 1, y)
		end
		if y <= 20
			puts "Y: #{y}"
			grid(x, y + 1)
		end
	end
end
x = 0
y = 0

grid(x,y)