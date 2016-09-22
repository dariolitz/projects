rand_number = Random.new
stuttgart = []
hoffenheim = []

10.times do
  stuttgart << rand_number.rand(0..3)
  hoffenheim << rand_number.rand(0..3)
end

i = 0
stuttgart_score = 0
hoffenheim_score = 0

while i < stuttgart.length
  if stuttgart[i] > hoffenheim[i]
    stuttgart_score += 3
  elsif stuttgart[i] < hoffenheim[i]
    hoffenheim_score += 3
  else
    hoffenheim_score += 1
    stuttgart_score += 1
  end
  i += 1
end

puts "Stuttgart: #{stuttgart_score}, Hoffenheim: #{hoffenheim_score}"
