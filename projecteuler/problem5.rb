# https://projecteuler.net/problem=5

i = 1

while 1 + 1 == 2
	k = 0
	j = 2
	while j <= 20
		k = (i % j)
		break if k != 0
		j += 1
	end
	if k == 0
		puts i
		puts i.class
		break
	end
	i += 1
end

