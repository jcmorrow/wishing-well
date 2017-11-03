require "rails_helper"

describe Estate do
  it { is_expected.to cost(3) }
  it { is_expected.to be_worth_points(1) }
end
