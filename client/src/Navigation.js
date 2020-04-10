import React from 'react';

import {
    Collapse,
    Nav,
    Navbar,
    NavbarBrand,
    NavItem,
    NavLink,
    Form,
    FormControl,
    Button
} from 'react-bootstrap';

import {
    BrowserRouter,
    Route,
    Switch,
    Link
} from 'react-router-dom';

import logo from './logo.svg';

class Navigation extends React.Component {



  render () {

    return (

    <Navbar bg="dark" variant="dark">
    <Navbar.Brand href="#home">
      <img
        alt=""
        src={logo}
        width="30"
        height="30"
        className="d-inline-block align-top"
      />{' '}
      Keyword Scout
    </Navbar.Brand>
    <Nav className="mr-auto">
      <Nav.Link href="#home">Home</Nav.Link>
      <Nav.Link href="#about">About</Nav.Link>
      <Nav.Link href="#pricing">Copy To Clipboard</Nav.Link>
    </Nav>
    <Form inline>
      <FormControl type="text" placeholder="Search" className="mr-sm-2" />
      <Button variant="outline-info">Search</Button>
    </Form>
  </Navbar>

    )
  }
}

export default Navigation;
