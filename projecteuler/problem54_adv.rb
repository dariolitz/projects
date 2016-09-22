# Processing Poker results
class Array
  def same_values?
    self.uniq.length == 1
  end
end

def read_hands
  f = File.open('p054_poker.txt')
  f.each do |round|
    rounds << round.split("\n")
  end
  rounds.each do |round|
    hands << round[0].delete!(' ').scan(/.{10}/)
  end
  hands.each do |hand|
    hand[0] = hand[0].scan(/.{2}/)
    hand[1] = hand[1].scan(/.{2}/)
  end
  hands
end

class Round
  attr_accessor :hand1, :hand2

  def initialize (hand1, hand2)
    @hand1 = hand1
    @hand2 = hand2
  end

  def value(displayed)
    displayed = displayed[0]
    case displayed
    when 'T'
      return 10
    when 'J'
      return 11
    when 'Q'
      return 12
    when 'K'
      return 13
    when 'A'
      return 14
    else
      return displayed.to_i
    end
  end

  def suit(displayed)
    displayed[1]
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
  end

  def same_suit(hand)
    suit_array(hand).same_values?
  end

  def detect(values, count)
    values.each do |e|
      return e, true if values.count(e) == count
    end
    return false
  end

  def high_card(hand)
    score = 0
    values = value_array(hand).reverse
    i = 6
    values.each do |v|
      score += v ** i
      i -= 1
    end
    return score
  end

  def one_pair(hand)
    values = value_array(hand).reverse!
    detect(values, 2)
  end

  def two_pairs(hand)
    pairs = 0
    values = value_array(hand)
    pair1 = detect(values, 2)
    if pair1 != false
      values.delete(detect(values, 2)[0])
      pair2 = detect(values, 2)
      pairs = pair1[1] && pair2[1] if pair2 != false
    end
    return pairs if pairs
  end

  def three(hand)
    values = value_array(hand).reverse!
    pair = detect(values, 3)

    return 3000 if pair
  end

  def straight(hand)
    straight = true
    i = 1
    while i <= 4
      if value_array(hand)[i] != value_array(hand)[i - 1] + 1
        straight = false
        break
      end
      i += 1
    end
    return 4000 if straight
  end

  def flush(hand)
    return 5000 if same_suit(hand) == true && same_suit(hand2) == false
  end

  def full_house(hand)
    values = value_array(hand).reverse!
    pair1 = detect(values, 2)
    if pair1 != false && pair1[1] == true
      values.delete(detect(values, 2)[0])
      pair2 = true if values.length == 3 && values.same_values?
      pairs = pair1[1] && pair2
    end
    return pair1[1] if pairs
  end

  def four(hand)
    values = value_array(hand).reverse!
    pair = detect(values, 3)
    return 7000 if pair
  end

  def straight_flush(hand) # TODO: implement score
    straight = true if same_suit(hand)
    i = 1
    while i <= 4
      if value_array(hand)[i] != value_array(hand)[i - 1] + 1
        straight = false
        break
      end
      i += 1
    end
    return 8000 if straight
  end

  def royal_flush(hand)
    royal = 0
    if (value_array(hand) - [10, 11, 12, 13, 14]).empty? && same_suit(hand)
      royal = true
    else
      royal = false
    end
    return 9000 if royal
  end

  def read_winner(score1, score2)
    return 0 if score1.nil? && score2.nil?
    if (!score.nil? && score2.nil?) || ((!score2.nil? && !score1.nil?) && score1 > score2)
      return 1
    elsif score1 == score2
      return 3
    else
      return 2
    end
  end
end

rounds = []

read_hands.each do |round|
  rounds << Round.new(round[0], round[1])
end
i = 1
rounds.each do |round|
  puts "Round#{i}: hand1:#{round.hand1}, hand2:#{round.hand2}"
  puts round.read_winner(round.four(round.hand1), round.four(round.hand2))
  puts round.read_winner(round.straight(round.hand1), round.straight(round.hand2))
  puts round.read_winner(round.high_card(round.hand1), round.high_card(round.hand2))
  i += 1
end
