print "Laenge:"
length = gets.chomp.to_i
print "Sonderzeichen erlaubt ? (y/n)"
token = gets.chomp

chars_string = "1234567890abcdefghijklmnopqrstuvwxyz!""$%&/()><="
chars_string_strict = "1234567890abcdefghijklmnopqrstuvwxyz"

if token == "y"
	chars = chars_string.split("")
else
	chars = chars_string_strict.split("")
end
random = Random.new()
password_array = []
length.times do
	rand_index = random.rand(chars.length - 1)
	password_array << chars[rand_index]
end

password = password_array.join
puts "Password: #{password}"