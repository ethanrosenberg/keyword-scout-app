import React from 'react';

import {
    Modal
} from 'react-bootstrap';


class BetaModal extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      data = this.props.data;
    }
  }


  render () {

    return (

      <Modal show={this.props.show} onHide={handleClose}>
          <Modal.Header closeButton>
            <Modal.Title>Modal heading</Modal.Title>
          </Modal.Header>
          <Modal.Body>Woohoo, you're reading this text in a modal!</Modal.Body>
          <Modal.Footer>
            <Button variant="secondary" onClick={handleClose}>
              Close
            </Button>
            <Button variant="primary" onClick={handleClose}>
              Save Changes
            </Button>
          </Modal.Footer>
        </Modal>

    )
  }
}

export default BetaModal;
