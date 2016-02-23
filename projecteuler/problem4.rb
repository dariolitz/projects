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
product = 0
final_product = 0
palindrom_string = 0

# while factor_1 > 0 && factor_2 > 0
# 	product = factor_1 * factor_2
# 	if palindrom?(product.to_s.split("")) == 1
# 			puts "Factor 1: #{factor_1}\nFactor 2: #{factor_2}\nProduct: #{product}"
# 			if product > final_product
# 				final_product = product
# 			end
# 	else
# 		puts "Factor 1: #{factor_1}\nFactor 2: #{factor_2}\nProduct: #{product}\n "
# 		if factor_1 > 0
# 			factor_1 -= 1
# 		end
# 	end
# end

while factor_1 > 0
	while factor_2 > 0
		product = factor_1 * factor_2
		palindrom_string = product.to_s.split("")
		if palindrom?(palindrom_string) == 1
				if product > final_product
					final_product = product
				end
		else
		end
		factor_2 -= 1
	end
	factor_2 = 999
	factor_1 -= 1
end

puts final_product