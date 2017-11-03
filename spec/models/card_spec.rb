require "rails_helper"

describe Card do
  it { is_expected.to cost(0) }
  it { is_expected.to be_worth_points(0) }
  it { is_expected.to be_worth_money(0) }

  describe "#to_s" do
    it "returns the name of its own class" do
      card = Card.new
      class_name = double("class name")
      allow(card).to receive(:class).and_return(class_name)
      allow(class_name).to receive(:to_s).and_return(class_name)

      expect(card.to_s).to eq(class_name)
    end
  end
end
