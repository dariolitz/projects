noten = []

20.times do
	note = Random.new
	noten << (note.rand(6.0) * 2).ceil.to_f / 2
end

noten.delete(noten.max)
noten.delete(noten.min)

puts noten

sum = 0
noten.each do |note|
	sum = sum + note
end

puts "Durchschnitt:"
puts durchschnitt = ((sum/noten.length) * 2).ceil.to_f / 2
