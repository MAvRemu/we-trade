import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tracked"
export default class extends Controller {
  static targets = ["box", "expand"]

  connect() {
    this.boxTarget.addEventListener('mouseover', (event) => {console.log("hovered")});
  }


}
