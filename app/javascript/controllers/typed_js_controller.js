import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
      new Typed(this.element, {
        strings: ["Rent a Bike", "Explore The City With Bikeshare!"],
        typeSpeed: 50,
        loop: true
      })
    }
  }
