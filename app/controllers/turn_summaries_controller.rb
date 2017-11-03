class TurnSummariesController < ApplicationController
  def show
    @match = MatchSerializer.new(Match.find(params[:match_id]))
    respond_to do |format|
      format.json do
        render json: @match
      end
      format.html
    end
  end
end
