import React from "react";
import { BrowserRouter as Router, Route,Switch, Redirect, Link } from "react-router-dom";
import { Container } from './Container/Index';

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {}

  create_account = (body) => {
    const url = "/account/create-account";
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => {
        console.log(response)
      })
      .catch(error => { console.log(error) });
  }

  render() {
    const triggerText = 'Create account';
    const onSubmit = (event) => {
      event.preventDefault(event);
      const account_config = {
        subdomain: event.target.subdomain.value
      }
      this.create_account(account_config)
    };
    return (
      <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
        <div className="jumbotron jumbotron-fluid bg-transparent">
          <div className="container secondary-color">
            {/* <Link
              to="/contact-us"
              className="btn btn-lg custom-button"
              role="button"
            >
              Create new account
            </Link> */}
            <Container triggerText={triggerText} onSubmit={onSubmit} />
          </div>
        </div>
      </div>
    )

  }

}
export default Home;