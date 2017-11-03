require "rails_helper"

describe Smithy do
  it { is_expected.to cost(4) }
  it "tells the player to draw 4 cards" do
    smithy = Smithy.new
    player = spy("player")

    smithy.play!(target: player)

    expect(player).to have_received(:draw_cards).with(4)
  end
end
