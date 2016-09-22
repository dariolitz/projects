def multi_check(number)
  multiplied_numbers = []
  for i in 2..6 do
    multiplied_numbers << (number * i)
  end
  return multiplied_numbers
end

j = 0
def contains_digits(base_number, multiplied_numbers)
  is_containing = true
  multiplied_numbers.each do |multiplied_number|
    multiplied_number.to_s.split('').each do |multiplied_char|
      unless base_number.to_s.include?(multiplied_char)
        is_containing = false
        break
      end
    end
  end
  puts base_number if is_containing
end

while j < 100_000_000
  contains_digits(j, multi_check(j))
  j += 1
end
