eingabe = gets

eingabe = eingabe.split(" ")

eingabe.each do |address|
		if 	address =~ /^\w*(\.\w*)?@\w*\.(com|de|it|at|ch)$/
			puts "#{address} ist eine gueltige Email-Adresse"
		else
			puts "#{address} ist keine gueltige Email-Adresse"
		end
end

