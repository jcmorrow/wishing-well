import React from "react";
import CardList from "./card_list";

export default class DeckList extends React.Component {
  constructor(props)
  {
    super(props);
  }
  render () {
    var decklists = this.props.deck_lists.map(function(deck_list) {
      return (
        <div class="deck-list">
          <CardList {...deck_list}/>
        </div>
      );
    });
    return (
      <div>
        <h1>Deck Lists</h1>
        {decklists}
      </div>
    )
  }
}
