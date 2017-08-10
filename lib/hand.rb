# Tier hierarchy: Ace is 14, King: 13, Queen: 12, Jack: 11
# 10. Royal Flush
# 9. Straight Flush
# 8. Four of a kind
# 7. Full House
# 6. Flush
# 5. Straight
# 4. Three of a kind
# 3. Two pair
# 2. One pair
# 1. High card
class Hand
  attr_reader :hand

  def initialize(five_cards)
    # {9=>[12,11,10,9,8] }
    @hand = Hash.new {|h,k| h[k] = [] }
    @hand = five_cards
  end

  def self.calculate_hand(five_cards)
    hand_values = five_cards.map do |card|
      card.value
    end.sort

    hand_suits = five_cards.map do |card|
      card.suit
    end

    if royal_flush(hand_values, hand_suits)
      royal_flush(hand_values, hand_suits)
    elsif straight_flush(hand_values, hand_suits)
      straight_flush(hand_values, hand_suits)
    elsif four_of_a_kind(hand_values)
      four_of_a_kind(hand_values)
    elsif full_house(hand_values)
      full_house(hand_values)
    elsif flush(hand_values, hand_suits)
      flush(hand_values, hand_suits)
    elsif straight(hand_values)
      straight(hand_values)
    elsif three_of_a_kind(hand_values)
      three_of_a_kind(hand_values)
    elsif two_pair(hand_values)
      two_pair(hand_values)
    elsif one_pair(hand_values)
      one_pair(hand_values)
    elsif high_card(hand_values)
      high_card(hand_values)
    else return false # should never reach
    end
  end

  private
  def self.straight(hand_values)
    p hand_values
    return false unless hand_values.last - hand_values.first == 4
    return false unless hand_values.uniq == hand_values
    {5 => hand_values.reverse }
  end

  def self.flush(hand_values, hand_suits)
    return false unless hand_suits.uniq.length == 1
    {6 => hand_values.reverse }
  end

  def self.straight_flush(hand_values, hand_suits)
    return false unless (straight(hand_values) && flush(hand_values, hand_suits))
    {9 => hand_values.reverse }
  end

  def self.royal_flush(hand_values, hand_suits)
    return false unless (straight_flush(hand_values, hand_suits) &&
    hand_values.max == 14)
    {10 => hand_values.reverse}
    # hand_values.sort == [10, 11, 12, 13, 14]
  end

  def self.one_pair(hand_values)
    return false unless hand_values.uniq.length == 4
    arr = []
    counter = Hash.new(0)
    hand_values.each {|v| counter[v] += 1 }
    2.times do
      arr += counter.select {|k,v| v == 2 }.keys
    end
    arr += counter.select {|k,v| v == 1 }.keys.sort.reverse
  end

  def self.two_pair(hand_values)
    counter = Hash.new(0)
    hand_values.each {|v| counter[v] += 1 }
    counter.values.sort == [1, 2, 2]
  end

  def self.three_of_a_kind(hand_values)
    counter = Hash.new(0)
    hand_values.each {|v| counter[v] += 1 }
    counter.values.sort == [1, 1, 3]
  end

  def full_house(hand_values)

  end


  def self.high_card(hand_values)

  end

end
