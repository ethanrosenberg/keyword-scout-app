import React from 'react';


import {
    Button
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
      loading: true,
      copied: false
    }

  }



  componentDidMount() {

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

        setTimeout(() => {
          const node = ReactDOM.findDOMNode(this);
          const child = node.querySelector('svg');
                child.setAttribute('width', '5000');
        }, 0)

      })






  }


   render() {



     const loading = this.state.loading

     const copyStyle = {
        position: 'fixed',
        bottom:15,
        right:15
      };


     return (

    <div className="custom-container">

    <CopyToClipboard text={this.state.keywords.toString().split(",").join("\n")} onCopy={() => this.setState({copied: true})}>
                <Button style={copyStyle} variant="primary" type="submit" size="sm">
                  Copy To Clipboard
               </Button>
             </CopyToClipboard>

    { loading
      ?
      <Loading />
      :
      <Tree
        data={this.state.data}
        height={900}
        width={1150}
        svgProps={{
          className: 'custom',
        }}
        animated />

    }
    </div>


     )

   }

 }

 export default HomeContainer;
