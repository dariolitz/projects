i = 2 ** 1000

i = i.to_s.split("")
puts i.map(&:to_i).inject(:+)