import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["news"]

  connect() {

    console.log("Hello from our first Stimulus controller")
    console.log(this.newsTarget)
  }

  disable(){
    console.log('event')
    console.log(this)
  }
}
