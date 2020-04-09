import React from 'react';



import Tree from 'react-tree-graph';
import ReactDOM from "react-dom";

class HomeContainer extends React.Component {
  constructor() {
    super()

    this.state = {
      data: ''
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
        console.log(response)
        console.log(response)

        this.setState({ data: response })

        setTimeout(() => {
          const node = ReactDOM.findDOMNode(this);
          const child = node.querySelector('svg');
                child.setAttribute('width', '5000');
        }, 0)

      })






  }



   render() {



     return (



    <div className="custom-container">
    	<Tree
    		data={this.state.data}
    		height={900}
    	  width={1150}
    		svgProps={{
    			className: 'custom',
    		}}
        animated />
    </div>

     )

   }

 }

 export default HomeContainer;
