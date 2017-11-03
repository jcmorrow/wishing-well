class DeckListsController < ApplicationController
  def show
    @match = Match.find(params[:match_id]).to_json(methods: [:deck_lists])
  end
end
