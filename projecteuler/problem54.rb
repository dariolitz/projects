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

def same_suit(hand)
  suit_array(hand).same_values?
end

def detect(values, count)
  values.detect do |e|
    if values.count(e) == count
      return e, true
    end
  end
  return false
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
  pair1 = detect(values1, 2)
  pair2 = 0
  values2 = value_array(hand2).reverse!
  pair2 = detect(values2, 2)
  pair1 = [0,0] if pair1.nil? || pair1 == false
  pair2 = [0,0] if pair2.nil? || pair2 == false
  if pair1[0] > pair2[0]
    return 1
  elsif pair2[0] > pair1[0]
    return 2
  elsif pair1[0] != 0 && pair2[0] != 0 && pair1[0] == pair2[0]
    return 3
  else
    return 0
  end
end

def two_pairs(hand1, hand2)
  pairs1 = 0
  values1 = value_array(hand1)
  pair1_1 = detect(values1, 2)
  if pair1_1 != false
    values1.delete(detect(values1, 2)[0])
    pair1_2 = detect(values1, 2)
    if pair1_2 != false
      pairs1 = pair1_1[1] && pair1_2[1]
    end
  end
  pairs2 = 0
  values2 = value_array(hand2).reverse!
  pair2_1 = detect(values2, 2)
  if pair2_1 != false
    values2.delete(detect(values2, 2)[0])
    pair2_2 = detect(values2, 2)
    if pair2_2 != false
      pairs2 = pair2_1[1] && pair2_2[1]
    end
  end
  if pairs1 == true && pairs2 != true
    return 1
  elsif pairs2 == true && pairs1 != true
    return 2
  elsif pairs1 == true && pairs2 == true
    return 3
  else
    return 0
  end
end

def three(hand1, hand2)
  pair1 = 0
  values1 = value_array(hand1).reverse!
  pair1 = values1.detect { |e| values1.count(e) == 3}
  pair2 = 0
  values2 = value_array(hand2).reverse!
  pair2 = values2.detect { |e| values2.count(e) == 3}
  pair1 = 0 if pair1.nil?
  pair2 = 0 if pair2.nil?
  if pair1 > pair2
    return 1
  elsif pair2 > pair1
    return 2
  elsif pair1 != 0 && pair2 != 0 && pair1 == pair2
    return 3
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
  if straight1 == true && straight2 == false
    return 1
  elsif straight2 == true && straight1 == false
    return 2
  elsif straight1 == true && straight2 == true
    return 3
  else
    return 0
  end
end

def flush(hand1, hand2)
  if same_suit(hand1) == true && same_suit(hand2) == false
    return 1
  elsif same_suit(hand2) == true && same_suit(hand1) == false
    return 2
  elsif same_suit(hand1) == true && same_values(hand2) == true
    return 3
  else
    return 0
  end
end

def full_house(hand1, hand2)
  values1 = value_array(hand1).reverse!
  pair1_1 = detect(values1, 2)
  if pair1_1 != false && pair1_1[1] == true
    values1.delete(detect(values1, 2)[0])
    pair1_2 = true if values1.length == 3 && values1.same_values?
    pairs1 = pair1_1[1] && pair1_2
  end
  values2 = value_array(hand2).reverse!
  pair2_1 = detect(values2, 2)
  if pair2_1 != false
    values2.delete(detect(values2, 2)[0])
    pair2_2 = true if values2.length == 3 && values2.same_values?
    pairs2 = pair2_1[1] && pair2_2
  end
  if pairs1 == true && pairs2 != true
    return 1
  elsif pairs2 == true && pairs1 != true
    return 2
  elsif pairs1 == true && pairs2 == true
    return 3
  else
    return 0
  end
end

def four(hand1, hand2)
  values1 = value_array(hand1).reverse!
  pair1 = values1.detect { |e| values1.count(e) == 4}
  values2 = value_array(hand2).reverse!
  pair2 = values2.detect { |e| values2.count(e) == 4}
  pair1 = 0 if pair1.nil?
  pair2 = 0 if pair2.nil?
  if pair1 > pair2
    return 1
  elsif pair2 > pair1
    return 2
  elsif pair1 != 0 && pair2 != 0 && pair1 == pair2
    return 3
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
  if straight1 == true && straight2 == false
    return 1
  elsif straight2 == true && straight1 == false
    return 2
  elsif straight1 == true && straight2 == true
    return 3
  else
    return 0
  end
end

def royal_flush(hand1, hand2)
  royal1 = 0
  if (value_array(hand1) - [10, 11, 12, 13, 14]).empty? && same_suit(hand1)
    royal1 = true
  else
    royal1 = false
  end
  royal2 = 0
  if (value_array(hand2) - [10, 11, 12, 13, 14]).empty? && same_suit(hand2)
    royal2 = true
  else
    royal2 = false
  end
  if royal1 == true && royal2 == false
    return 1
  elsif royal2 == true && royal1 == false
    return 2
  elsif royal1 == true && royal2 == true
    return 3
  else
    return 0
  end
end

def get_winner(round)
  winner = royal_flush(round[0], round[1])
  if winner == 3
    winner = high_card(round[0], round[1])
    puts "round: #{round}, winner: #{winner} with high_card"
  elsif winner == 0
    winner = straight_flush(round[0], round[1])
    if winner == 3
      winner = high_card(round[0], round[1])
      puts "round: #{round}, winner: #{winner} with high_card"
    elsif winner == 0
      winner = four(round[0], round[1])
      if winner == 3
        winner = high_card(round[0], round[1])
        puts "round: #{round}, winner: #{winner} with high_card"
      elsif winner == 0
        winner = full_house(round[0], round[1])
        if winner == 3
          winner = high_card(round[0], round[1])
          puts "round: #{round}, winner: #{winner} with high_card"
        elsif winner == 0
          winner = flush(round[0], round[1])
          if winner == 3
            winner = high_card(round[0], round[1])
            puts "round: #{round}, winner: #{winner} with high_card"
          elsif winner == 0
            winner = straight(round[0], round[1])
            if winner == 3
              winner = high_card(round[0], round[1])
              puts "round: #{round}, winner: #{winner} with high_card"
            elsif winner == 0
              winner = three(round[0], round[1])
              if winner == 3
                winner = high_card(round[0], round[1])
                puts "round: #{round}, winner: #{winner} with high_card"
              elsif winner == 0
                winner = two_pairs(round[0], round[1])
                if winner == 3
                  winner = high_card(round[0], round[1])
                  puts "round: #{round}, winner: #{winner} with high_card"
                elsif winner == 0
                  winner = one_pair(round[0], round[1])
                  if winner == 3
                    winner = high_card(round[0], round[1])
                    puts "round: #{round}, winner: #{winner} with high_card"
                  else
                    puts "round: #{round}, winner: #{winner} with one pair"
                  end
                else
                  puts "round: #{round}, winner: #{winner} with two pairs"
                end
              else
                puts "round: #{round}, winner: #{winner} with three"
              end
            else
              puts "round: #{round}, winner: #{winner} with straight"
            end
          else
            puts "round: #{round}, winner: #{winner} with flush"
          end
        else
          puts "round: #{round}, winner: #{winner} with full_house"
        end
      else
        puts "round: #{round}, winner: #{winner} with four of a kind"
      end
    else
      puts "round: #{round}, winner: #{winner} with straight flush"
    end
  else
    puts "round: #{round}, winner: #{winner} with royal flush"
  end
end

get_hands.each do |round|
  get_winner(round)
end
