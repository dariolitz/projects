array = [4, 5, 7, 3, 23, 6, 49, 50]

def getSmallestElement(array, start = nil, ende = nil)
	if array.length == 2 # Abbruchbedingung: Wenn das Array nur noch aus zwei oder einem Element besteht
		if array[start] > array[ende]
			array.delete_at(start)
		else
			array.delete_at(ende)
		end
	elsif array.length > 2
		start_1 = 0
		ende_1 = (array.length/2+array.length%2) - 1
		start_2 = (array.length/2+array.length%2)
		ende_2 = array.length - 1
		getSmallestElement(array, start_1, ende_1)
		getSmallestElement(array, start_2, ende_2)
	end
end
getSmallestElement(array)