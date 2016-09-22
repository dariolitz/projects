d = 1.00

while d < 1000
  digitstring = (1/d).to_s.split(".")[1]
  array = digitstring.split("")
  array.pop
  d += 1
end

def get_intervall(array)
  left_index = (array.length/2) - 1
  right_index = (array.length/2)

  left_index_beginning = left_index
  right_index_beginning = right_index

  counter = 0

  while left_index >= 0
    left_value = array[left_index]
    right_value = array[right_index]

    if right_value == array[right_index_beginning] && left_value == array[left_index_beginning]
      puts counter
    end
    left_index -= 1
    right_index += 1
    counter += 1
  end
end
