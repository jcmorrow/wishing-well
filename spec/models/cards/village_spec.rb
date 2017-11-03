require "rails_helper"

describe Village do
  it { is_expected.to cost(3) }
  describe "#play" do
    context "when the player has an action left" do
      it "draws the user a card and gains them two actions" do
        card = Village.new
        player = spy("Player")

        card.play! target: player

        expect(player).to have_received(:draw_cards ).with(1)
        expect(player).to have_received(:gain_actions).with(2)
      end
    end
  end
end
