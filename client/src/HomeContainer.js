import React from 'react';



import Tree from 'react-tree-graph';

class HomeContainer extends React.Component {
  constructor() {
    super()

    this.state = {
      data: ''
    }

  }



  componentWillMount() {

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


      })


  }



   render() {



     return (



    <div className="custom-container">
    	<Tree
    		data={this.state.data}
    		height={800}
    		width={400}
    		svgProps={{
    			className: 'custom'
    		}}/>
    </div>

     )

   }

 }

 export default HomeContainer;
