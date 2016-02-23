def next_step(current)
	if current % 2 == 0
		current = current / 2
	else
		current = current * 3 + 1
	end
end

current = 1
current_param = 0
highest = 0
inner_counter = 0
highest_current = 0
while current < 1000000 do
	inner_counter = 0
	current_param = current
	while true do
		current_param = next_step(current_param)
		inner_counter += 1
		break if current_param == 1
	end
	if inner_counter > highest
		highest = inner_counter
		highest_current = current
	end
	current += 1
end

puts highest_current