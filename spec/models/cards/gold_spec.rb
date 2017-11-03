require "rails_helper"

describe Gold do
  it { is_expected.to cost(6) }
  it { is_expected.to be_worth_money(3) }
end
