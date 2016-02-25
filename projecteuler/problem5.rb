# https://projecteuler.net/problem=5

dividend = 1
result = 0

while true
	divisor = 1
	result = true
	while divisor <= 20
		if dividend % divisor != 0
			result = false
			break
		end
		divisor += 1
	end
	if result == true
		puts dividend
		break
	end
	dividend += 1
end