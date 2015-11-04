# Implementiere die Methode unevenSumFrom1To(int n), die die Summe aller ungeraden Zahlen 
# von 1 bis n als Rückgabe liefert.  Die Verwendung von Schleifen ist dabei nicht erlaubt!

print "n = "
n = gets.chomp.to_i
$counter = 0

def unevenSumFrom1To(n)
	if n >= 1 # Abbruchbedingung
		if n % 2 != 0 # ist ungerade ?
			$counter += 1
		end
		unevenSumFrom1To(n-1) # Rekursions
	end
	return $counter
end

puts unevenSumFrom1To(n)
