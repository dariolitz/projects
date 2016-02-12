# https://projecteuler.net/problem=6

sumsquare = 0
squaresum = 0
i = 0
j = 0

while i <= 100
	squaresum = squaresum + i ** 2
	i += 1
end

while j <= 100
	sumsquare = sumsquare + j
	j += 1
end
sumsquare = sumsquare ** 2

puts sumsquare - squaresum
