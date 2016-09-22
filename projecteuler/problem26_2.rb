class String
  def delete_at_index! n
    slice! n
    self
  end
  def delete_at_index n
    dup.delete_at_index! n
  end
end


def cycles_check(digitstring)
	digit_array = digitstring.split("")
	range = 1

		digit_array.each_with_index do |digit, index|
			next if index == 0 || index == 1
			# break if index == (digit_array.length - 1) / 2
			puts index
			puts range
			puts "#{digit_array[(index - range)..index]}:#{digit_array[(index + range)..(index + range + 1)]}"
		end
end

i = 1.00
while i < 10 do
	divided = (1.00 / i)
	splitted = divided.to_s.delete_at_index!(1).delete_at_index!(0)
	cycles_check(splitted)
	i += 1
end

cycles_check("07142857142857142")