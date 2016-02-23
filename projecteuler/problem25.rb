fibos = [0,1]
arr_index = 2
while true
	fibos << (fibos[arr_index - 1] + fibos[arr_index - 2])
	if fibos[arr_index].to_s.length >= 1000
		puts fibos.length
		break
	end
	arr_index += 1
end