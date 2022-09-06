import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Hello from our first Stimulus controller")
    console.log(this.formTarget)
  }

  revealContent() {
    console.log(this.formTarget.classList)
    this.formTarget.classList.toggle("visually-hidden")
  }

}
