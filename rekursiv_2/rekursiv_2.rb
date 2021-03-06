# Schreibe eine rekursiven Algorithmus, der den Stammbaum für eine Person auf der Console ausgibt. 
# Für die Person Carl, sollte der Stammbaum wie folgt aussehen:
class Person
	attr_reader :name, :father, :mother

	def initialize(name, father, mother)
		@name = name # (String)
		@father = father # (Person Object)
		@mother = mother # (Person Object)
	end
end

class Family
	def create_family
		carola = Person.new("Carola", nil, nil)
		sina = Person.new("Sina", nil, nil)
		andreas = Person.new("Andreas", sina, nil)
		christian = Person.new("Christian", nil, nil)
		julia = Person.new("Julia", nil, carola)
		hugo = Person.new("Hugo", christian, julia)
		colin = Person.new("Colin", nil, nil)
		lena = Person.new("Lena", andreas, nil)
		eva = Person.new("Eva", colin, lena)
		carl = Person.new("Carl", hugo, eva)
		
		return carl
	end
end

family = Family.new

carl = family.create_family

def tree(person, tab) # tab = counter für Einrückungen
	if person.father # hat die Person einen Vater ?
		tree(person.father, tab + 1) # Rekursion: immer der Vater der aktuellen Person
	else
		(tab + 1).times do
			print "\t"
		end		
		puts "Unbekannt"
	end
	tab.times do
		print "\t"
	end
	puts "#{person.name}"
	if person.mother # hat die Person eine Mutter ?
		tree(person.mother, tab + 1) # Rekursion: immer die Mutter der aktuellen Person
	else
		(tab + 1).times do
			print "\t"
		end
		puts "Unbekannt"
	end
end
tree(carl,0)