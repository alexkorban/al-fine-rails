import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pieces"
export default class extends Controller {
  connect() {}

  toggle(e) {
    const id = e.target.dataset.id
    const index = e.target.dataset.index
    console.log(e.target.dataset)
    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(`/pieces/${id}/toggle`, {
      method: "POST", // *GET, POST, PUT, DELETE, etc.
      mode: "cors", // no-cors, *cors, same-origin
      cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
      credentials: "same-origin", // include, *same-origin, omit
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken,
      },
      body: JSON.stringify({ index, practice: e.target.checked }), // body data type must match "Content-Type" header
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
