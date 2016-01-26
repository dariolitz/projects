# https://projecteuler.net/problem=4


def palindrom?(array)
	i = 0
	palindrome = 1

	while i < (array.length / 2)
		if array[i] != array[((array.length - 1)- i)]
			palindrome = 0
		end
		i += 1
	end
	return palindrome
end

factor_1 = 999
factor_2 = 999
product = nil

while factor_1 > 0 && factor_2 > 0
	product = factor_1 * factor_2
	if palindrom?(product.to_s.split("")) == 1
			puts "Factor 1: #{factor_1}\nFactor 2: #{factor_2}\nProduct: #{product}"
		break
	else
		puts "Factor 1: #{factor_1}\nFactor 2: #{factor_2}\nProduct: #{product}"
		if factor_1 > 0
			factor_1 -= 1
		end
	end
end
			