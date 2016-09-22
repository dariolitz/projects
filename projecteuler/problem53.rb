def faculty(number)
  i = number
  number -= 1
  while number > 1
    i *= number
    number -= 1
  end
  i = 1 if i == 0
  return i
end

def check_ncr(n, r)
  faculty(n) / (faculty(r) * faculty(n - r))
end

n = 1
counter = 0
while n <= 100
  r = 1
  while r <= n
    puts "r: #{r}"
    puts "n: #{n}"
    puts check_ncr(n, r)
    counter += 1 if check_ncr(n, r) > 1_000_000
    r += 1
  end
  n += 1
end
puts counter
