import React from 'react';
import logo from './logo.svg';
import './App.css';
import Tree from 'react-d3-tree';
import HomeContainer from './HomeContainer'
import Container from 'react-bootstrap/Container';
import Navigation from './Navigation'


function App() {
  return (
    <div className="App">

        <Navigation />

        <HomeContainer />



    </div>
  );
}

export default App;
