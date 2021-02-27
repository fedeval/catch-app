import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.apiKey = this.data.get("apiKey")
    this.sessionId = this.data.get("sessionId")
    this.token = this.data.get("token")
    this.initializeSession()
  }

  disconnect() {
    if (this.session) {
      this.session.disconnect()
    }
  }

  handleError(error) {
    if (error) {
      console.error(error.message);
    }
  }

  initializeSession() {
    this.session = OT.initSession(this.apiKey, this.sessionId);

    // Subscribe to a newly created stream
    this.session.on('streamCreated', this.subscribeToStream.bind(this))

    // Create a publisher
    this.publisher = OT.initPublisher('publisher', {
      insertMode: 'append',
      width: '100%',
      height: '100%'
    }, this.handleError.bind(this));

    // Connect to the session
    this.session.connect(this.token, this.connectStream.bind(this));
  }


  subscribeToStream(event) {
    this.session.subscribe(event.stream, 'subscriber', {
      insertMode: 'append',
      width: '100%',
      height: '100%'
    }, this.handleError.bind(this));
  }

  connectStream(error) {
    if (error) {
      this.handleError(error);
    } else {
      this.session.publish(this.publisher, this.handleError.bind(this));
    }
  }
}
