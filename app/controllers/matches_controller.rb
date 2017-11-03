class MatchesController < ApplicationController
  def create
    @match = Match.new(match_params)
    create_match = CreateMatch.new(match: @match)
    create_match.perform

    if create_match.success?
      redirect_to match_win_rate_path(@match.id)
    else
      render :new
    end
  end

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  private

  def match_params
    params.require(:match).permit(:name, :game_count, strategy_ids: [])
  end

end
