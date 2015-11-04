class Car

	private
	attr_writer :type, :driver, :codriver, :location

	public
	attr_reader :type, :driver, :codriver, :location

	def initialize(type, location)
		@type = type
		@location = location
		puts "Auto der Marke #{type} wurde erstellt und steht in #{location.name}."
	end

	def drive_to(location)
		if location.is_a?(Location)
			if self.driver != nil
				self.location = location
				driver.location = location
				if codriver != nil
					codriver.location = location
				end
				puts "Der #{self.type} ist nach #{location.name} gefahren!"
			end
		else
			raise(RuntimeError, "#{location.name} ist kein Ort!")
		end
	end

	def get_on_as_driver(person)
		if person.is_a?(Person)
		 if person.location == self.location
			if self.driver == nil
				self.driver = person
				puts "#{person.name} steigt auf der Fahrerseite des #{self.type} ein!"
			else
				puts "Es gibt schon einen Fahrer!"
			end
			else
			puts "Fahrer befindet sich nicht im selben Ort wie das Auto!"
		 end
		else
			raise(RuntimeError, "#{person.name} ist keine Person!")
		end
	end

	def get_on_as_codriver(person)
		if person.is_a?(Person)
		 if person.location == self.location
			if self.codriver == nil
				self.codriver = person
				puts "#{person.name} steigt auf der Beifahrerseite des #{self.type} ein!"
			else
				puts "Es gibt schon einen Beifahrer!"
			end
		 else
			puts "Beifahrer befindet sich nicht im selben Ort wie das Auto!"
		 end
		else
			raise(RuntimeError, "#{person.name} ist keine Person!")
		end
	end

	def get_off_driver
		puts "Der Fahrer #{self.driver.name} steigt aus!"
		self.driver = nil
	end		

	def get_off_codriver
		puts "Der Beifahrer #{self.codriver.name} steigt aus!"
		self.codriver = nil
	end	
end

class Person

	attr_writer :location
	attr_reader :name, :location

	def initialize(name, location)
		@name = name
		@location = location
		 puts "Person mit Name #{name} wurde erstellt und befindet sich in #{location.name}."
	end
end

class Location

	attr_reader :name

	def initialize(name)
		@name = name
		puts "Ort mit Name #{name} wurde erstellt."
	end
end

class Scenario

	attr_accessor :name

	def initialize(scenario)
		@name = name
	end

	def create_scenario
		konstanz = Location.new("Konstanz")
		radolfzell = Location.new("Radolfzell")
		muenchen = Location.new("Muenchen")
		golf = Car.new("Golf", konstanz)
	 	hugo = Person.new("Hugo", konstanz)
	 	hans = Person.new("Hans", radolfzell)
		golf.get_on_as_driver(hugo)
	  golf.drive_to(radolfzell)
	  golf.get_on_as_codriver(hans)
	  golf.drive_to(muenchen)
	  golf.get_off_driver
	  golf.get_off_codriver
	  golf.drive_to(muenchen)
	end
end

	scenario = Scenario.new("Konstanz - Radolfzell - Muenchen")
  scenario.create_scenario