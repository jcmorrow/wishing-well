import React from "react";
import { VictoryChart } from "victory";
import { VictoryLine } from "victory";

export default class TurnSummary extends React.Component {
  constructor(props) {
    super(props);
    this.state = props;
    this.loadTurnSummaryFromServer = this.loadTurnSummaryFromServer.bind(this);
  }
  componentDidMount () {
    this.loadTurnSummaryFromServer();
    setInterval(this.loadTurnSummaryFromServer, 1000);
  }
  loadTurnSummaryFromServer () {
    $.ajax({
      url: "/matches/" + this.state.id +"/turn_summary",
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState(data);
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("/matches/" + this.state.id, + "/turn_summary", status, err.toString());
      }.bind(this)
    });
  }
  render () {
    var victory_lines = this.state.turn_summary.map(function(turn_summary)
        {
          return(
            <VictoryLine
              style={{
                data:
                {
                  stroke: turn_summary.color,
                  strokeWidth: 1
                }
              }}
              interpolation="basis"
              data={turn_summary.turn_summary}
              x={"0"}
              y={"1"}/>
          );
        });
    return (
      <div className="container">
        <h1>Turn Summary for {this.state.name}</h1>
        <h3>Games Played: {this.state.games_count}</h3>
        <VictoryChart
          width={1000}
          height={500}
          animate={{velocity: 0.02}}
          >
          { victory_lines }
        </VictoryChart>
      </div>
    );
  }
}
