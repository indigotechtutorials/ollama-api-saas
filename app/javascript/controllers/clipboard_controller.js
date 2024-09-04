import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["input", "copyButton", "success"]

  copy(e) {
    e.preventDefault()
    // Select the text field
    this.inputTarget.select();
    this.inputTarget.setSelectionRange(0, 99999); // For mobile devices

    // Copy the text inside the text field
    navigator.clipboard.writeText(this.inputTarget.value);

    if (!this.copyButtonTarget.classList.contains("hidden")) {
      this.copyButtonTarget.classList.add("hidden")
      this.successTarget.classList.remove("hidden")
      setTimeout(() => {
        this.copyButtonTarget.classList.remove("hidden")
        if (!this.successTarget.classList.contains("hidden")) {
          this.successTarget.classList.add("hidden")
        }
      }, 1000)
    }
  }
}
