array = [4, 5, 7, 3, 23, 6, 49, 50]

def getSmallestElement(array, start = nil, ende = nil)

	if array.length == 2 # Abbruchbedingung: Wenn das Array nur noch aus zwei oder einem Element besteht
		if array[start] > array[ende]
			array.delete_at(start)
		else
			array.delete_at(ende)
		end
		puts "array:#{array}"
	elsif array.length > 2
		array = array[0..(array.length/2+array.length%2) - 1]
		start = 0
		ende = array.length - 1
		getSmallestElement(array, start, ende)
	end
end
getSmallestElement(array)