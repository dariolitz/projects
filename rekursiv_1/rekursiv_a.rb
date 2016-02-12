# Implementiere die Methode unevenSumFrom1To(int n), die die Summe aller ungeraden Zahlen 
# von 1 bis n als Rückgabe liefert.  Die Verwendung von Schleifen ist dabei nicht erlaubt!

print "n = "
n = gets.chomp.to_i

def unevenSumFrom1To(n, counter)
	if n >= 1 # Abbruchbedingung
		if n % 2 != 0 # ist ungerade ?
			counter += 1
		end
			counter = unevenSumFrom1To(n - 1, counter) # Rekursion
	end
	return counter
end

puts unevenSumFrom1To(n,0)