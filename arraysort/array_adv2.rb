unsorted = ["ab","aa","bg","ba","5","4","7","3","0","2","1","6","1","2","0","7"]
sorted = []

def mini(array)
  i = nil
  first = nil
  second = nil
  INT_MAX = first = second
  array.each_with_index do |i, index|
    if i[index] < first
      second = first
      first = i[index]
    elsif i[index] < second && i[index] != first
      second = i[index]
    end
  end
  if second == INT_MAX
    print "There is no second smallest element"
    puts
  else
    return first, second
  end
end # kleinster Wert des Arrays ermitteln

puts mini(unsorted)
