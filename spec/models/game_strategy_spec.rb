require "rails_helper"

describe GameStrategy do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:strategy) }
  it { is_expected.to validate_presence_of(:game) }
  it { is_expected.to validate_presence_of(:strategy) }
end
