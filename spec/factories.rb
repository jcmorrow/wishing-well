FactoryGirl.define do
  factory :user do
    email { "email@domain.com" }
    password { "P4s$wurd" }
  end

  factory :card do
    type "Copper"
  end

  factory :game_strategy do
    association :strategy
    association :game
  end

  factory :estate
  factory :copper
  factory :village
  factory :province

  factory :strategy do
    sequence(:name) { |n| "Strategy #{n}" }
  end

  factory :priority do
    card_type { "Province" }
    sequence(:sequence) { |n| n }
  end

  factory :match do
    game_count { 1 }
    sequence(:name) { |n| "Match #{n}" }
    transient do
      strategy_count 2
    end

    after(:build) do |match, evaluator|
      strategies = create_list(:strategy, evaluator.strategy_count)
      match.strategies << strategies
    end

  end

  factory :game do
    association :match
  end

  factory :hand do
  end
end
