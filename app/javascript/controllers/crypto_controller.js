import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="crypto"
export default class extends Controller {
  static targets = ["suggestions","form", "input", "list"]
  connect() {
    console.log(this.formTarget)
  }
  cmon(){
    console.log("nooo");
  }
  update(){
    console.log("see");
    const url = `/cryptos/?query=${this.inputTarget.value}&commit=Search`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }


}
