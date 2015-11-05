# Implementiere eine Methode, die aus einem übergebenen int-Array 
# das kleinste Element zurück gibt.
# Auch hier dürfen keine Schleifen verwendet werden. 
# Hinweis: Die Methode hat die folgende Signatur: 
# getSmallestElement(int[] array, int start, int ende) und gibt ein Int zurück.
# Zerteile in jedem rekursiven Aufruf das Array in möglichst zwei gleichgroße Teil-Arrays.
# Überlege dir weiterhin eine passende Abbruchbedingung.

array = [4, 5, 7, 3, 23, 6, 49, 50]
$lowest = array[0]

def getSmallestElement(array, start = nil, ende = nil)
	if array.length <= 2 # Abbruchbedingung: Wenn das Array nur noch aus einem Element besteht
		if array[0] <= $lowest
			$lowest = array[0] # Prüfung ob Wert im Array kleiner ist als bisher kleinster
		end
		return $lowest # kleinster Wert des Arrays
	else
		splitted = array.each_slice((array.length/2.0).round).to_a # modulo
		start = splitted[0] # erste Hälfte
		ende = splitted[1] # zweite Hälfte
		getSmallestElement(start) # start als array-parameter übergeben
		getSmallestElement(ende) # ende als array-parrameter übergeben
	end
end

puts getSmallestElement(array)
