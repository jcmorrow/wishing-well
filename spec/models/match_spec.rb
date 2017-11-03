require "rails_helper"

describe Match do
  it { is_expected.to validate_presence_of(:game_count) }
end
