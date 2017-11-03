class SimulateMatch < ActiveJob::Base
  def perform(match:)
    match.game_count.times do
      SimulateGame.perform_now(match: match)
    end
  end
end
