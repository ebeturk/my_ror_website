import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="see-more"
export default class extends Controller {
  static targets = ["content", "toggleButton"];

  connect() {
    this.originalContent = this.contentTarget.innerHTML;
    if (this.data.has("truncated-length")) {
      this.truncateContent();
    }
  }

  toggle() {
    if (this.isTruncated) {
      this.contentTarget.innerHTML = this.originalContent;
      this.toggleButtonTarget.innerText = "see less...";
    } else {
      this.truncateContent();
    }
  }

  truncateContent() {
    const truncatedLength = parseInt(this.data.get("truncated-length"));
    if (this.originalContent.length > truncatedLength) {
      this.contentTarget.innerHTML = `${this.originalContent.substring(0, truncatedLength)}...`;
      this.toggleButtonTarget.innerText = "see more...";
    }
  }

  get isTruncated() {
    return this.contentTarget.innerHTML !== this.originalContent;
  }
}
