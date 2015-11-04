primes = []
def zahlenbisN (n)
	array = []

	b = 2
	while array.length < n-1
		array << b
		b = b + 1
	end

	return array
end

a = zahlenbisN(300)

a.each do |i|
	primes << i
	a.each do |j|
		if j % i == 0
			a.delete(j)
		end
	end
end

puts primes