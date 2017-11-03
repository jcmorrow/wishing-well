class MatchSerializer < ActiveModel::Serializer
  attributes :id, :name, :games_count, :turn_summary
end
