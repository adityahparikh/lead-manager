import React from "react";
import { BrowserRouter as Router, Route,Switch, Redirect, Link } from "react-router-dom";

class Dashboard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {}

  render() {
    return (
      <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
        <div className="jumbotron jumbotron-fluid bg-transparent">
          <div className="container secondary-color">
            <div>Welcome to Dashboard</div>
          </div>
        </div>
      </div>
    )

  }

}
export default Dashboard;