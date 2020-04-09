import React from 'react';

import { Tree, treeUtil } from 'react-d3-tree';

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

        this.setState({ data: [response] })



      })


  }



   render() {

     const myData = this.state.data
     const myTreeData = [
       {
         name: 'Top Level',
         attributes: {
           keyA: 'val A',
           keyB: 'val B',
           keyC: 'val C',
         },
         children: [
           {
             name: 'Level 2: A',
             attributes: {
               keyA: 'val A',
               keyB: 'val B',
               keyC: 'val C',
             },
           },
           {
             name: 'Level 2: B',
           },
         ],
       },
     ];

     return (

       <div id="treeWrapper" style={{width: '70em', height: '50em'}}>

       <Tree data={this.state.data} />

     </div>

     )

   }

 }

 export default HomeContainer;
