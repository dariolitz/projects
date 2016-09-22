def toss_coin
  rand(0..1)
end

def in_dezimal(fraction)
  fraction[0] / fraction[1]
end

start_capital = 1.00
prop = [1.0, 3.0]

def price(start_capital, prop)
  if toss_coin == 1
    start_capital += (start_capital * (in_dezimal(prop))) * 2
  else
    start_capital -= start_capital * (in_dezimal(prop))
  end
end

i = 0
1000.times do
  puts "i: #{i}"
  start_capital = price(start_capital, prop)
  if start_capital <= 0
    puts start_capital
    break
  end
  if start_capital >= 1_000_000_000
    puts start_capital
    break
  end
  i += 1
end
