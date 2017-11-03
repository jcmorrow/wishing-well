import React from "react";
import ReactDOM from "react-dom";
import DeckList from "./components/deck_list";
import PriorityList from "./components/priority_list";
import TurnSummary from "./components/turn_summary";
import WinRateDisplay from "./components/win_rate_display";


//export components to global context
(function()
{
  let gl = "";
  if(window === undefined){
    gl = global;
  } else {
    gl = window;
  }
  gl.React = React;
  gl.ReactDOM = ReactDOM;
  gl.DeckList = DeckList;
  gl.PriorityList = PriorityList;
  gl.TurnSummary = TurnSummary;
  gl.WinRateDisplay = WinRateDisplay;
})()
