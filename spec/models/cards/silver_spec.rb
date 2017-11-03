require "rails_helper"

describe Silver do
  it { is_expected.to cost(3) }
  it { is_expected.to be_worth_money(2) }
end
