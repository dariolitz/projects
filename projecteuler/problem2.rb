# https://projecteuler.net/problem=2

fibos = [0,1]
arr_index = 2
while (fibos[arr_index - 1] + fibos[arr_index - 2]) < 4000000
	fibos << (fibos[arr_index - 1] + fibos[arr_index - 2])
	arr_index += 1
end
fibos.delete_at(0)
fibos.delete_at(1)

even_fibos = []

fibos.each do |fibo|
	if fibo % 2 == 0
		even_fibos << fibo
	end
end

puts even_fibos.inject(:+)


