class Person
	attr_reader :name, :father, :mother

	def initialize(name, father, mother)
		@name = name #(String)
		@father = father # (Person Object)
		@mother = mother # (Person Object)
	end

	def get_mother
		return mother
	end

	def get_father
		return father
	end

	def get_name
		return name
	end
end

class Family
	def create_family
		carola = Person.new("Carola", nil, nil)
		andreas = Person.new("Andreas", nil, nil)
		christian = Person.new("Christian", nil, nil);
		julia = Person.new("Julia", nil, carola);
		hugo = Person.new("Hugo", christian, julia);
		colin = Person.new("Colin", nil, nil);
		lena = Person.new("Lena", andreas, nil);
		eva = Person.new("Eva", colin, lena);
		carl = Person.new("Carl", hugo, eva);
	 	
	 	return carl

	end
end

family = Family.new

def tree(family)
	puts family.create_family
end

tree(family)