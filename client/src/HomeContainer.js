import React from 'react';



import Tree from 'react-tree-graph';
import ReactDOM from "react-dom";
import Loading from './Loading'

class HomeContainer extends React.Component {
  constructor() {
    super()

    this.state = {
      data: '',
      keywords: '',
      loading: true
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

     const onClick={() => {navigator.clipboard.writeText(this.state.keywords)}}

     const loading = this.state.loading


     return (

    <div className="custom-container">

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
