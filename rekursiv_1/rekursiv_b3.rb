# Implementiere eine Methode, die aus einem übergebenen int-Array 
# das kleinste Element zurück gibt.
# Auch hier dürfen keine Schleifen verwendet werden. 
# Hinweis: Die Methode hat die folgende Signatur: 
# getSmallestElement(int[] array, int start, int ende) und gibt ein Int zurück.
# Zerteile in jedem rekursiven Aufruf das Array in möglichst zwei gleichgroße Teil-Arrays.
# Überlege dir weiterhin eine passende Abbruchbedingung.

array = [4, 5, 7, 3, 23, 6, 49, 50, 9, 17, 60]

def getSmallestElement(array, start = nil, ende = nil)
	if array.length <= 2 # Abbruchbedingung: Wenn das Array nur noch aus zwei oder einem Element besteht
		if array.length == 2
			if array[0] > array[1]
				array.delete_at(0)
			else
				array.delete_at(1)
			end
			puts "array: #{array}"
		end
	else
		start = array[0..(array.length/2+array.length%2) - 1] # erste Hälfte
		ende = array[(array.length/2+array.length%2)..(array.length) - 1] # zweite Hälfte
		getSmallestElement(array, start, ende) # start als array-parameter übergeben
		getSmallestElement(array, start, ende) # ende als array-parrameter übergeben
	end
end

getSmallestElement(array)