require 'deck'

describe "#initialize" do
  let(:deck) { Deck.populate_deck}
  it "has 52 cards"do
    expect(deck.cards.length).to eq(52)
  end
end
