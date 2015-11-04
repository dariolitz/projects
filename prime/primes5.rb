start = Time.now
n = 1000000
amountp = 0

def pusharray(n) # Zahlen von 2 bis n in das Array schreiben
	array = []
	b = 2

	while array.length < n-1
		array << b
		b += 1
	end
	return array
end

primes = []
for i in pusharray(n)
	prim = true
	for j in 2..Math.sqrt(i)
		if i % j == 0
			prim = false
			break
		end
	end
 if prim 
 		primes << i
 		amountp += 1 # Anzahl der Primzahlen
 	end
end

puts primes
puts "Amount of primes = #{amountp}"
finish = Time.now

diff = finish - start
puts "Time = #{diff}"