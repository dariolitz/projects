# https://projecteuler.net/problem=1

all = []
divided = []
i = 1

while i < 1000
	all << i
	i += 1
end

all.each do |i|
	if i % 3 == 0 || i % 5 == 0
		divided << i
	end
end


puts divided.inject(:+)
