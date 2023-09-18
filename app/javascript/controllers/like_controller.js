import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["like", "count"];

  connect() {
    console.log("💗 Connected to like controller");
  }

  toggleLike(event) {
    event.preventDefault();

    const id = event.target.dataset.id;
    const type = event.currentTarget.dataset.type;
    const isLiked = this.data.get("liked") === "true";
    const method = isLiked ? "DELETE" : "POST";
    let url;
    let likeId = event.currentTarget.dataset.likeId;

    if (type === "Article") {
      if (isLiked) {
        url = `/articles/${id}/likes/${likeId}`;
      } else {
        url = `/articles/${id}/likes`;
      }
    } else if (type === "Comment") {
      if (isLiked) {
        url = `/likes/${likeId}`;
      } else {
        url = `/comments/${id}/likes`;
      }
    }

    fetch(url, {
      method: method,
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
        "Accept": "application/json"
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error(`Network response was not ok: ${response.statusText}`);
      }
      return response.json();
    })
    .then(data => {
      if (data.liked) {
        this.data.set("liked", "true");
        this.likeTarget.textContent = "💗";
        this.likeTarget.setAttribute('data-like-id', data.like_id);
      } else {
        this.data.set("liked", "false");
        this.likeTarget.textContent = "❤️";
        this.likeTarget.removeAttribute('data-like-id');
      }
      this.countTarget.textContent = data.like_count; // Update the like count on the page
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }
}
