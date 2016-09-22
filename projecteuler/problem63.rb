def digit_length(digit)
	digit.to_s.length
end

n = 0
counter = 0
i = 0

while counter < 10000000
	i = 0
	while i < 10
		if n == (i ** digit_length(n))
			puts n
		end
		i += 1
	end
	counter += 1
	n += 1
end
