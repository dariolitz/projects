# https://projecteuler.net/problem=3


i = 600851475143
j = 0
primcounter = 600851475143
highest = 0

while primcounter >= 0
	prim = true
	for j in 2..Math.sqrt(i)
		if i % j == 0
			prim = false
			break
		end
	end
	if prim
		puts i
		primcounter -= 1
	end
	i -= 1
end

puts i