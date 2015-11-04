speed_input = "10km/stunde"
route_input = "5 km"
time_needed = 0

def speed(speed_input)
	speed = /(\d)/.match(speed_input).captures[1]
	unit = /(\d*)(\w*)/.match(speed_input).captures[1]
	time = speed_input.split("km/")[1]

	return speed, unit, time
end

def route(route_input)
	route = route_input.split(" ")[0]
	unit = route_input.split(" ")[1]

	return route, unit
end

puts route_var = route(route_input)[0].to_f
puts route_unit = route(route_input)[1]

puts speed_var = speed(speed_input)[0].to_f
puts speed_unit = speed(speed_input)[1]
puts speed_time = speed(speed_input)[2]

if speed_unit == "km"
	if speed_time == "stunde"
		if route_unit == "km"
			time_needed = route_var / speed_var
		end
	elsif speed_time == "minute"
		time_needed = route_var / speed_var
	end
end

puts time_needed

