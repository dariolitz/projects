array = [4, 5, 7, 3, 23, 6, 49, 50]

def getSmallestElement(array, start = nil, ende = nil)

	if array.length == 2 # Abbruchbedingung: Wenn das Array nur noch aus zwei oder einem Element besteht
		if array[start] > array[ende]
			array.delete_at(start)
		else
			array.delete_at(ende)
		end
	elsif array.length > 2
		array_2 = array[(array.length/2+array.length%2)..array.length - 1]
		array = array[0..(array.length/2+array.length%2) - 1]
		puts "array:#{array}"
		puts "array_2:#{array_2}"
		puts "nex"
		start = 0
		ende = array.length - 1
		ende_2 = array_2.length - 1
		getSmallestElement(array, start, ende)
		getSmallestElement(array_2, start, ende_2)
	end
end
getSmallestElement(array)