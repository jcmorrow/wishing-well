require "rspec/expectations"

RSpec::Matchers.define :cost do |cost|
  match do |card|
    card.class.cost == cost
  end
end

RSpec::Matchers.define :be_worth_points do |points|
  match do |card|
    card.class.new.points == points
  end
end

RSpec::Matchers.define :be_worth_money do |money|
  match do |card|
    card.class.new.money == money
  end
end
