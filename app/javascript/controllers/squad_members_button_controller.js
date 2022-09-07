import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="squad-members-button"
export default class extends Controller {
  static targets = ["members", "button","close"]
  connect() {
    console.log("I'm inside");
  }
  open(){
    console.log("sad");
    if(this.membersTarget.classList.contains("members-hide")){
      console.log("yes");
      this.membersTarget.classList.remove('members-hide')
      this.membersTarget.classList.add('members-show')
    }
  }
  close(){
    if(this.membersTarget.classList.contains('members-show')){
      console.log("yes");
      this.membersTarget.classList.remove('members-show')
      this.membersTarget.classList.add('members-hide')
    }
    console.log("closed");
  }
}
