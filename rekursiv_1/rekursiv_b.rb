# Implementiere eine Methode, die aus einem übergebenen int-Array das kleinste Element ¨ zurück gibt. Auch hier dürfen keine Schleifen verwendet werden. 
# Hinweis: Die Methode hat die folgende Signatur: getSmallestElement(int[] array, int start, int ende)
# und gibt ein Int zurück. Zerteile in jedem rekursiven Aufruf das Array in möglichst zwei gleichgroße Teil-Arrays.
# Überlege dir weiterhin eine passende Abbruchbedingung.

def getSmallestElement(array,start,ende)
	if start == ende # besteht das Array aus einem Element ?
		min = array[start]
	else # besteht das Array aus mehr als einem Element ?
		mid = (start + ende) / 2 # mitte des Arrays berechnen
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

array = [7,19,3,4,5,6,7,1]

puts getSmallestElement(array,0,array.length - 1)