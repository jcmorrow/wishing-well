require "rails_helper"

describe Strategy do
  it { is_expected.to have_and_belong_to_many(:matches) }
  it { is_expected.to have_many(:game_strategies) }
  it { is_expected.to have_many(:priorities) }

  it "has a default list of priorities" do
    expect(create(:strategy).priorities).not_to be_empty
  end
end
