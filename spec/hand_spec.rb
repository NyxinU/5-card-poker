require "hand"
require "card"

describe "#straight" do
  let(:card2) { Card.new(2,:D)}
  let(:card3) { Card.new(3,:D)}
  let(:card4) { Card.new(4,:D)}
  let(:card5) { Card.new(5,:S)}
  let(:card6) { Card.new(6,:D)}
  it "returns a hash if straight" do
    expect(Hand.calculate_hand([card2,card3,card4,card5,card6])).to eq({5 => [6,5,4,3,2]})
  end
end

describe "calculate_hand"do
  let(:four_of_a_kind) { [Card.new(2,:D),Card.new(2,:C),Card.new(2,:H),Card.new(2,:S),Card.new(3,:D)] }
  it "returns a hash "do
    expect(Hand.calculate_hand(four_of_a_kind)).to eq({8 => [3,2,2,2,2]})
  end
end
