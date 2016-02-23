def powersum(number)
	result = 0
	number.each do |digit|
		result = result + digit ** 5
	end
	return result
end

i = 1000000
digit_array = []
result = 0
while i > 1
	digit_array = i.to_s.chars.map(&:to_i)
	if i == powersum(digit_array)
		result = result + i
	end
	i -= 1
end

puts result