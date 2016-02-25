def in_words(number)
	number_in_words = 0
	number_string = number.to_s.split("")
	digits = { "1"=> "one", "2"=> "two", "3"=> "three", "4"=> "four", "5"=> "five", "6"=> "six", "7"=> "seven", "8"=> "eigth", "9"=> "nine", "10"=> "ten", "11"=> "eleven", "12"=> "twelve", "13"=> "thirteen"}
	dezimals = {"1"=> "teen", "2"=> "twenty", "3"=> "thirty", "4"=> "fourty", "5"=> "fifty", "6"=> "sixty", "7"=> "seventy", "8"=> "eighty", "9"=> "ninety"}
	if number < 20
		if number > 13
			number_in_words = digits[number_string[1]] + dezimals[number_string[0]]
		else
			number_in_words = digits[number_string.inject(:+)]
		end
	elsif number >= 20 && number < 100
		if number_string[1] == "0"
			number_in_words = dezimals[number_string[0]]
		else
			number_in_words = dezimals[number_string[0]] + digits[number_string[1]]
		end
	elsif number < 1000
		if number_string[1] == "0" && number_string[2] == "0"
			puts
		end
	else
		puts "onethousand"
	end
	return number_in_words
end

input = 0

while input != "exit"
	input = gets.chomp
	puts in_words(input.to_i)
end