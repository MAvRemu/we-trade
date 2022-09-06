import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="crypto"
export default class extends Controller {
  static targets = ["suggestions","form", "input", "list", "squadid"]
  connect() {
    console.log(this.formTarget)
  }
  cmon(){
    console.log("nooo");
  }
  update(){
    console.log(this.squadidTarget.innerText);
    console.log("see");
    const url = `/cryptos/?query=${this.inputTarget.value}&commit=Search&squad_id=${this.squadidTarget.innerText}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }
}
