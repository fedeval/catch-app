import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    const this.apiKey = this.data.get("apiKey")
    const this.sessionId = this.data.get("sessionId")
    const this.token = this.data.get("token")
    this.initializeSession()
  }

  function handleError(error) {
    if (error) {
      alert(error.message);
    }
  }

  function initializeSession() {
    const this.session = OT.initSession(this.apiKey, this.sessionId);

    // Subscribe to a newly created stream

    // Create a publisher
    const this.publisher = OT.initPublisher(this.element, {
      insertMode: 'append',
      width: '100%',
      height: '100%'
    }, handleError);

    // Connect to the session
    this.session.connect(this.token, function(error) {
      // If the connection is successful, publish to the session
      if (error) {
        handleError(error);
      } else {
        this.session.publish(this.publisher, handleError);
      }
    });
  }
}
