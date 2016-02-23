array = []
a = 2
b = 2

while a <= 100
	while b <= 100
		array << (a ** b)
		b += 1
	end
	b = 2
	a += 1
end

array.sort!.uniq!
puts array.length