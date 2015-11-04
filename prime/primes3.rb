start = Time.now
n = 100000
p = 0
array = []
b = 2

while array.length < n-1
	array << b
	b += 1
end


primes = []
array.each do |i|
	prim = true
	(2..i/2).each do |j|
		if i % j == 0
			prim = false
			break
		end
	end
 if prim 
 		primes << i
 		p += 1
 	end
end

puts primes
puts "Amount of primes = #{p}"
finish = Time.now

diff = finish - start
puts "Time = #{diff}"