import React from 'react';


import {
    Button, Modal, Form
} from 'react-bootstrap';

import Tree from 'react-tree-graph';
import ReactDOM from "react-dom";
import Loading from './Loading'
import {CopyToClipboard} from 'react-copy-to-clipboard';

class HomeContainer extends React.Component {
  constructor() {
    super()

    this.state = {
      data: '',
      keywords: '',
      beta_data: '',
      beta_starting_keyword: '',
      beta_loading: true,
      loading: true,
      copied: false,
      show: false
    }

  }



  componentDidMount() {
    ReactDOM.findDOMNode(this).scrollIntoView();

    const headers = {
      method: "GET",
      headers: {
        "Content-Type": "application/json"
      }
    }

    fetch('http://localhost:3000/api/v1/new_search', headers)
      .then(r => r.json())
      .then(response => {
        console.log(response.response_data)

        this.setState({ data: response.response_data, keywords: response.keywords, loading: false })

      })


  }


   render() {

  const handleBetaClick = event => {

    this.setState({
      show: true
    })

    const headers = {
      method: "GET",
      headers: {
        "Content-Type": "application/json"
      }
    }

    fetch('http://localhost:3000/api/v1/beta', headers)
      .then(r => r.json())
      .then(response => {
        console.log(response.beta_data)
        console.log(response.starting_keyword)
        this.setState({
          beta_data: response.beta_data,
          beta_starting_keyword: response.starting_keyword,
          beta_loading: false
        })

      })

   }

   const handleBetaClose = event => {

      this.setState({
        show: false
      })

    }

     const loading = this.state.loading

     const copyStyle = {
        position: 'fixed',
        bottom:15,
        right:15
      };

      const betaStyle = {
         backgroundColor: '#961010',
         borderColor: '#961010',
         position: 'fixed',
         bottom:15,
         left:15
       };

       const betaLoadingStyle = {
          height: 200

        };


     return (

    <div className="custom-container">




    { loading
      ?
      <Loading />
      :
      <>
      <Tree
        data={this.state.data}
        height={5000}
        width={5000}
        margins={{ bottom : 0, left : 20, right : 500, top : 50}}
        duration={500}
        svgProps={{
          className: 'custom',
        }}
        animated={true} />
        <Button onClick={handleBetaClick} style={betaStyle} variant="primary" type="submit" size="sm">
          Beta
       </Button>
        <CopyToClipboard text={this.state.keywords.toString().split(",").join("\n")} onCopy={() => this.setState({copied: true})}>
                    <Button style={copyStyle} variant="primary" type="submit" size="sm">
                      Copy To Clipboard
                   </Button>
        </CopyToClipboard>



        </>

    }



    <Modal size="lg" show={this.state.show} onHide={handleBetaClose}>
        <Modal.Header closeButton>
          <Modal.Title>Beta Results: {this.state.beta_starting_keyword}</Modal.Title>
        </Modal.Header>
        <Modal.Body>
        {
          this.state.beta_loading == false
          ?
          <Form.Group controlId="exampleForm.ControlTextarea1">
            <Form.Label>Keywords Found: {this.state.beta_data.length}</Form.Label>
            <Form.Control as="textarea" rows="20" value ={this.state.beta_data.toString().split(",").join("\n")}/>
          </Form.Group>
          :
            <div className="tempLoading" style={betaLoadingStyle}>

            <Loading />
            </div>



        }
          </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleBetaClose}>
            Close
          </Button>
          <Button variant="primary" onClick={handleBetaClose}>
            Save Changes
          </Button>
        </Modal.Footer>
      </Modal>

    </div>


     )

   }

 }

 export default HomeContainer;
