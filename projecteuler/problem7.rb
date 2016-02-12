# https://projecteuler.net/problem=7

i = 2
j = 0
primcounter = 0

while primcounter <= 10001
	prim = true
	for j in 2..Math.sqrt(i)
		if i % j == 0
			prim = false
			break
		end
	end
	if prim
		puts primcounter
		primcounter += 1
		puts i
	end
	i += 1
end

