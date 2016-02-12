# https://projecteuler.net/problem=20

def fac(number)
	result = 1
	while number > 0
		result = result * number
		number -= 1
	end
	return result
end

facarray = fac(100).to_s.split("")
facarrayint = []

facarray.each do |i|
	facarrayint << i.to_i
end

puts facarrayint.inject(:+)