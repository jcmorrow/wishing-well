require "rails_helper"

describe Game do
  it { is_expected.to belong_to(:match) }
  it { is_expected.to belong_to(:winner) }
  it { is_expected.to have_many(:game_strategies) }
end
