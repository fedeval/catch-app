import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.apiKey = this.data.get("apiKey")
    this.sessionId = this.data.get("sessionId")
    this.token = this.data.get("token")
    this.initializeSession()
  }

  handleError(error) {
    if (error) {
      console.error(error.message);
    }
  }

  initializeSession() {
    this.session = OT.initSession(this.apiKey, this.sessionId);

    // Subscribe to a newly created stream
    this.session.on('streamCreated', function(event) {
      this.session.subscribe(event.stream, 'subscriber', {
        insertMode: 'append',
        width: '100%',
        height: '100%'
      }, this.handleError.bind(this));
    });

    // Create a publisher
    this.publisher = OT.initPublisher('publisher', {
      insertMode: 'append',
      width: '100%',
      height: '100%'
    }, this.handleError.bind(this));

    // Connect to the session
    this.session.connect(this.token, function(error) {
      // If the connection is successful, publish to the session
      if (error) {
        this.handleError(error);
      } else {
        this.session.publish(this.publisher, this.handleError.bind(this));
      }
    });
  }
}
