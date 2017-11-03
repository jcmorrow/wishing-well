import React from "react";
import { VictoryPie } from "victory";

export default class WinRateDisplay extends React.Component {
  constructor (props) {
    super(props);
    this.state = props;
    this.loadWinRateFromServer = this.loadWinRateFromServer.bind(this);
  }
  componentDidMount () {
    this.loadWinRateFromServer();
    setInterval(this.loadWinRateFromServer, 1000);
  }
  loadWinRateFromServer () {
    $.ajax({
      url: "/matches/" + this.state.id +"/win_rate",
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({win_rates: data.win_rates});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("/matches/" + this.state.id, + "/win_rate", status, err.toString());
      }.bind(this)
    });
  }
  render () {
    return (
      <div className="container">
        <h1>Win Rates for {this.state.name}</h1>
        <VictoryPie
          data={this.state.win_rates}
          x={"name"}
          animate={{velocity: 0.02}}
          y={"win_rate"}
        />
      </div>
    );
  }
}

WinRateDisplay.defaultProps = { win_rates:
                                [
                                  {
                                    name: "win_rate_1",
                                    win_rate: 0,
                                    color: "#333",
                                    win_rate: 100,
                                    fill: "#333"
                                  }
                                ]
                              }
WinRateDisplay.propTypes = {
  win_rates: React.PropTypes.array
}
