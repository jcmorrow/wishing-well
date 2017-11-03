import React from "react";
import Priority from "./priority";

export default class PriorityList extends React.Component {
  constructor (props)
  {
    super(props);
  }
  get priorities () { return this.props.priorities; }
  render () {
    let priorityList = this.priorities.map(function(priority)
      {
        return(
          <Priority {...priority} />
        );
      }
    );
    return(
      <div className="priority-list">
        {priorityList}
      </div>
    );
  }
}
