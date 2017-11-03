class Hand < CardStore
  def play_cards(player:)
    while !cards.empty?
      card = cards.shift
      card.play!(target: player)
      player.played_pile.add_card card
    end
  end
end
