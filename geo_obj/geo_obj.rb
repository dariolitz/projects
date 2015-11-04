class Form
	attr_reader :id
	@@i = 1

	def initialize
		@id = 0
	@id = @id + @@i
		@@i += 1
	end

	def outline
		return 2 * Math::PI * self.radius
	end

	def area
		return Math::PI * (self.radius ** 2)
	end

	def to_s
	end
end

class Punkt < Form
	attr_reader :x, :y

	def initialize(x, y)
		super()
		@x = x
		@y = y
	end

	def self.new_from_point(point)
		new(point.x, point.y)
	end

	def signature
		puts "Punkt[#{self.id},#{self.x},#{self.y}]"
	end

	def distance(p2)
		Math.sqrt((x - p2.x)**2 + (y - p2.y)**2)
	end
end

class Kreis < Form
	attr_reader :mittelpunkt, :radius

	def initialize(mittelpunkt, radius)
		super()
		@mittelpunkt = mittelpunkt
		@radius = radius
	end

	def self.new_from_kreis(kreis)
		new(kreis.mittelpunkt, kreis.radius)
	end

	def signature
		puts "Kreis[#{self.id},[#{self.mittelpunkt.x},#{self.mittelpunkt.y}],#{self.radius}]"
	end
end

class Polygon < Form
	attr_reader :punkte

	def initialize(punkte)

	end

	def signature
		puts "Polygon[#{self.punkte}]"
	end
end


punkt = Punkt.new(2, 4)
punkt2 = Punkt.new(4, 8)
punkt3 = Punkt.new_from_point(punkt)
array = [punkt, punkt2]
kreis = Kreis.new(punkt, 5)
kreis2 = Kreis.new_from_kreis(kreis)
polygon = Polygon.new(array)


puts punkt.distance(punkt2)
puts kreis.outline
puts kreis.area
puts kreis2.outline

punkt.signature
punkt2.signature
kreis.signature
kreis2.signature
polygon.signature