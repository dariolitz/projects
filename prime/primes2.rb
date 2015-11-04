n = 300
p = 0

primes = []
(1..n).each do |i|
	prim = true
	(2..i/2).each do |j|
		if i % j == 0
			prim = false
			break
		end
	end
 if prim 
 		primes << i
 		p = p + 1
 	end
end

puts primes
puts p