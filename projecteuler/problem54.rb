class Array
  def same_values?
    self.uniq.length == 1
  end
end

def value_array(hand)
  array = []
  hand.each do |card|
    array << value(card[0])
  end
  return array.sort
end

def suit_array(hand)
  array = []
  hand.each do |card|
    array << suit(card)
  end
  return array
end


def get_hands
  f = File.open("p054_poker.txt")
  rounds = []
  hands = []
  f.each do |content|
    rounds << content.split("\n")
  end
  rounds.each do |content|
    content[0].delete!(" ")
    hands << content[0].scan(/.{10}/)
  end
  hands.each do |hand|
    hand[0] = hand[0].scan(/.{2}/)
    hand[1] = hand[1].scan(/.{2}/)
  end
  return hands
end

def value(displayed)
  displayed = displayed[0]
  if displayed == "T"
    displayed = 10
  elsif displayed == "J"
    displayed = 11
  elsif displayed == "Q"
    displayed = 12
  elsif displayed == "K"
    displayed = 13
  elsif displayed == "A"
    displayed = 14
  else
    displayed = displayed.to_i
  end 
end

def suit(displayed)
  displayed[1]
end

def high_card(hand1, hand2)
  highest_card1 = 0
  hand1.each do |card|
    if value(card[0]) > highest_card1
      highest_card1 = value(card[0])
    end
  end
  highest_card2 = 0
  hand2.each do |card|
    if value(card) > highest_card2
      highest_card2 = value(card)
    end
  end
  if highest_card1 > highest_card2
    return 1
  elsif highest_card2 > highest_card1
    return 2
  else
    return 0
  end
end

def one_pair(hand1, hand2)
  pair1 = 0
  values1 = value_array(hand1).reverse!
  values1.each do |value|
    pair1 = values1.detect { |e| values1.count(e) == 2}
    break
  end
  pair2 = 0
  values2 = value_array(hand2).reverse!
  values2.each do |value|
    pair2 = values2.detect { |e| values2.count(e) == 2}
    break
  end
  pair1 = 0 if pair1.nil?
  pair2 = 0 if pair2.nil?
  if pair1 > pair2
    return 1
  elsif pair2 > pair1
    return 2
  else
    return 0
  end
end

def three(hand1, hand2)
  pair1 = 0
  values1 = value_array(hand1).reverse!
  values1.each do |value|
    pair1 = values1.detect { |e| values1.count(e) == 3}
    break
  end
  pair2 = 0
  values2 = value_array(hand2).reverse!
  values2.each do |value|
    pair2 = values2.detect { |e| values2.count(e) == 3}
    break
  end
  pair1 = 0 if pair1.nil?
  pair2 = 0 if pair2.nil?
  if pair1 > pair2
    return 1
  elsif pair2 > pair1
    return 2
  else
    return 0
  end
end

def straight(hand1, hand2)
  straight1 = true
  i = 1
  while i <= 4
    if value_array(hand1)[i] != value_array(hand1)[i - 1] + 1
      straight1 = false
      break
    end
    i += 1
  end
  i = 1
  straight2 = true
  while i <= 4
    if value_array(hand2)[i] != value_array(hand2)[i - 1] + 1
      straight2 = false
      break
    end
    i += 1
  end
  if straight1 == true && straight2 == true && value_array(hand1).max > value_array(hand2).max
    return 1
  elsif straight1 == true && straight2 == true && value_array(hand2).max > value_array(hand1).max
    return 2
  elsif straight1 == true && straight2 == false
    return 1
  elsif straight2 == true && straight1 == false
    return 2
  else
    return 0
  end
end

def same_suit(hand)
  suit_array(hand).same_values?
end

def flush(hand1, hand2)
  if same_suit(hand1) == true && same_suit(hand2) == false
    return 1
  elsif same_suit(hand2) == true && same_suit(hand1) == false
    return 2
  else
    return 0
  end
end

def four(hand1, hand2)
  pair1 = 0
  values1 = value_array(hand1).reverse!
  values1.each do |value|
    pair1 = values1.detect { |e| values1.count(e) == 4}
    break
  end
  pair2 = 0
  values2 = value_array(hand2).reverse!
  values2.each do |value|
    pair2 = values2.detect { |e| values2.count(e) == 4}
    break
  end
  pair1 = 0 if pair1.nil?
  pair2 = 0 if pair2.nil?
  if pair1 > pair2
    return 1
  elsif pair2 > pair1
    return 2
  else
    return 0
  end
end

def straight_flush(hand1, hand2)
  straight1 = true if same_suit(hand1)
  i = 1
  while i <= 4
    if value_array(hand1)[i] != value_array(hand1)[i - 1] + 1
      straight1 = false
      break
    end
    i += 1
  end
  i = 1
  straight2 = true if same_suit(hand2)
  while i <= 4
    if value_array(hand2)[i] != value_array(hand2)[i - 1] + 1
      straight2 = false
      break
    end
    i += 1
  end
  if straight1 == true && straight2 == true && value_array(hand1).max > value_array(hand2).max
    return 1
  elsif straight1 == true && straight2 == true && value_array(hand2).max > value_array(hand1).max
    return 2
  elsif straight1 == true && straight2 == false
    return 1
  elsif straight2 == true && straight1 == false
    return 2
  else
    return 0
  end
end

get_hands.each do |round|
  winner = straight_flush(round[0], round[1])
  puts "round: #{round}, winner: #{winner}"
end