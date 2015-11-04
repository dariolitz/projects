class Form # Oberklasse
	attr_reader :id
	@@i = 1

	def initialize
		@id = 0
		@id = @id + @@i
		@@i += 1
	end
	def outline # Umfang
		if self.class == Kreis
			result = 2 * Math::PI * self.radius
		elsif self.class == Polygon
			current_point = 0
			next_point = 1
			result = 0
			(punkte.length).times do
				if next_point > (punkte.length - 1)
					next_point = 0
					result = result + Math.sqrt((punkte[current_point].x - punkte[next_point].x)**2 + 
					(punkte[current_point].y - punkte[next_point].y)**2)
				else
					result = result + Math.sqrt((punkte[current_point].x - punkte[next_point].x)**2 + 
					(punkte[current_point].y - punkte[next_point].y)**2)
					next_point += 1
					current_point += 1
				end
			end
		elsif self.class == Dreieck
			result = Math.sqrt(((punkt2.x - punkt1.x)**2) + (punkt2.y - punkt1.y)**2) + 
							 Math.sqrt(((punkt3.x - punkt2.x)**2) + (punkt3.y - punkt2.y)**2) + 
							 Math.sqrt(((punkt1.x - punkt3.x)**2) + ((punkt1.y - punkt3.y)**2))
		elsif self.class == Viereck
			result = Math.sqrt(((punkt2.x - punkt1.x)**2) + (punkt2.y - punkt1.y)**2) + 
							 Math.sqrt(((punkt3.x - punkt2.x)**2) + (punkt3.y - punkt2.y)**2) + 
							 Math.sqrt(((punkt4.x - punkt3.x)**2) + (punkt4.y - punkt3.y)**2) +
							 Math.sqrt(((punkt1.x - punkt4.x)**2) + (punkt1.y - punkt4.y)**2)
		end
		return result
	end

	def area # Fläche
		if self.class == Kreis
			Math::PI * (self.radius ** 2)
		elsif self.class == Polygon
			l = 0
			result = 0
			(punkte.length-1).times do
				result = result + (punkte[l].x + punkte[l+1].x) * (punkte[l+1].y - punkte[l].y)
				l += 1
			end
			return result.abs/2
		elsif self.class == Dreieck
			result = ((punkt2.y - punkt3.y) * punkt1.x) + ((punkt3.y - punkt1.y) * punkt2.x) + 
			((punkt1.y - punkt2.y) * punkt3.x)
			return result.abs/2
		elsif self.class == Viereck
			result = (punkt1.x + punkt2.x) * (punkt2.y - punkt1.y) + 
			(punkt2.x + punkt3.x) * (punkt3.y - punkt2.y) + 
			(punkt3.x + punkt4.x) * (punkt4.y - punkt3.y)
			return result.abs/2
		end
	end

	def toString # Signaturen ausgeben
		if self.class == Polygon
			print "Polygon[#{self.id},"
			punkte.each do |i|
				print "[#{i.x},#{i.y}]"
			end
			puts "]"
		elsif self.class == Punkt
			puts "Punkt[#{self.id},#{self.x},#{self.y}]"
		elsif self.class == Kreis
			puts "Kreis[#{self.id},[#{self.mittelpunkt.x},#{self.mittelpunkt.y}],#{self.radius}]"
		elsif self.class == Dreieck
			puts "Dreieck[#{self.id},[#{self.punkt1.x},#{self.punkt1.y}],[#{self.punkt2.x},#{self.punkt2.y}],[#{self.punkt3.x},#{self.punkt3.y}]]"
		elsif self.class == Viereck
			puts "Viereck[#{self.id},[#{self.punkt1.x},#{self.punkt1.y}],[#{self.punkt2.x},#{self.punkt2.y}],[#{self.punkt3.x},#{self.punkt3.y}],[#{self.punkt4.x},#{self.punkt4.y}]]"
		end
	end
end

class Punkt < Form
	attr_reader :x, :y

	def initialize(arg1, arg2=nil)
		super()
		if arg1.class == Punkt
			@x = arg1.x
			@y = arg1.y
		else
			@x = arg1
			@y = arg2
		end
	end

	def distance(p2)
		Math.sqrt((x - p2.x)**2 + (y - p2.y)**2)
	end
end

class Kreis < Form
	attr_reader :mittelpunkt, :radius

	def initialize(arg1, arg2=nil)
		super()
		if arg1.class == Kreis	
			@mittelpunkt = arg1.mittelpunkt
			@radius = arg1.radius
		else
			@mittelpunkt = arg1
			@radius = arg2
		end
	end
end

class Polygon < Form
	attr_reader :punkte

	def initialize(punkte)
		super()
		if punkte.class == Polygon
			@punkte = punkte.punkte
		else
			@punkte = punkte
		end
	end
end

class Dreieck < Form
	attr_reader :punkt1, :punkt2, :punkt3

	def initialize(arg1, arg2=nil, arg3=nil)
		super()
		if arg1.class == Dreieck
			@punkt1 = arg1.punkt1
			@punkt2 = arg1.punkt2
			@punkt3 = arg1.punkt3
		else
			@punkt1 = arg1
			@punkt2 = arg2
			@punkt3 = arg3
		end
	end
end

class Viereck < Form
	attr_reader :punkt1, :punkt2, :punkt3, :punkt4

	def initialize(arg1, arg2=nil, arg3=nil, arg4=nil)
		super()
		if arg1.class == Viereck
			@punkt1 = arg1.punkt1
			@punkt2 = arg1.punkt2
			@punkt3 = arg1.punkt3
			@punkt4 = arg1.punkt4
		else
			@punkt1 = arg1
			@punkt2 = arg2
			@punkt3 = arg3
			@punkt4 = arg4
		end
	end
end

# Test:
punkt = Punkt.new(2, 2)
punkt2 = Punkt.new(2, 4)
punkt3 = Punkt.new(4, 4)
punkt4 = Punkt.new(4, 2)
puts
array = [punkt, punkt2, punkt3, punkt4]
kreis = Kreis.new(punkt, 5)
kreis2 = Kreis.new(kreis)
polygon = Polygon.new(array)
polygon2 = Polygon.new(polygon)
dreieck = Dreieck.new(punkt, punkt2, punkt3)
viereck = Viereck.new(punkt, punkt2, punkt3, punkt4)

punkt.toString
punkt2.toString
punkt3.toString
punkt4.toString
puts
kreis.toString
kreis2.toString
polygon.toString
polygon2.toString
dreieck.toString
viereck.toString
puts
puts "Punkt1:Punkt2 distance: #{punkt.distance(punkt2)}"
puts "Kreis area: #{kreis.area}"
puts "Kreis outline: #{kreis.outline}"
puts "Polygon area: #{polygon.area}"
puts "Polygon outline: #{polygon.outline}"
puts "Dreieck area: #{dreieck.area}"
puts "Viereck area: #{viereck.area}"
puts "Dreieck outline: #{dreieck.outline}"
puts "Viereck outline: #{viereck.outline}"

puts punkt2.outline