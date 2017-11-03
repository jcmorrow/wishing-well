class WinRatesController < ApplicationController
  def show
    @match = Match.find(params[:match_id]).to_json(only: [:id, :name], methods: :win_rates)
    respond_to do |format|
      format.json do
        render json: @match
      end
      format.html
    end
  end
end
