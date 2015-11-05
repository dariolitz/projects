def getSmallestElement(array,start,ende)
	if start == ende # besteht das Array aus einem Element ?
		min = array[start]
	elsif start == (ende - 1) # besteht das Array aus zwei Elementen ?
		if array[start] < array[ende]
			min = array[start]
		elsif array[start] > array[ende]
			min = array[ende]
		end
	else # besteht das Array aus mehr als zwei Elementen ?
		mid = (start + ende) / 2 # mitte des Arrays berechnens
		min1 = getSmallestElement(array, start, mid) # erster Teil (von start bis mitte)
		min2 = getSmallestElement(array, mid + 1, ende) # zweiter Teil (von mitte bis ende)
		if min1 < min2
			min = min1
		else
			min = min2
		end
		return min
	end
end

array = [7,2,3,4,5,6,7,8,1,4]

puts getSmallestElement(array,0,array.length - 1)