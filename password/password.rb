password = "1234"
tries = 3

while tries > 0
	entry = gets.chomp
	if entry == password
		puts "Zugang"
		break
	else
		puts "Passwort falsch - erneut versuchen!"
		tries -= 1
	end
end


