import React from 'react';
import Loader from 'react-loader-spinner'

function Loading() {

  return (
    <div className="loadingBar"
    style={{
      position: 'absolute', left: '50%', top: '50%',
      transform: 'translate(-50%, -50%)'
  }}>
      <Loader
     type="Triangle"
     color="#00BFFF"
     height={200}
     width={200}
     />
    </div>

  )
}
export default Loading;
