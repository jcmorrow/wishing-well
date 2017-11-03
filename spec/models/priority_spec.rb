require "rails_helper"

describe Priority do
  describe "associations" do
    it { should belong_to(:strategy) }
    it { should validate_numericality_of(:sequence) }
  end
  describe "validations" do
    it { should validate_uniqueness_of(:sequence).scoped_to(:strategy_id) }
    it { should validate_presence_of(:sequence) }
    it { should validate_presence_of(:card_type) }
  end

  describe "default scope" do
    it "orders by ascending sequence" do
      create(:priority, sequence: 2)
      create(:priority, sequence: 1)

      expect(Priority.all.map(&:sequence)).to eq([1, 2])
    end
  end
end
