const status = () => {

  const buttonApprove = document.querySelector("#button-approve")


  document.querySelector(".status-bookings").addEventListener("click", (e) => {
    console.log(e.target)

    // approvedIcon.style.display = "initial"
    // deniedIcon.style.display = "none"

    if (e.target.nodeName == "A" && e.target.innerHTML == "Approve") {
       e.target.classList.add("disabled")
       e.target.nextElementSibling.style.display = "none"
    } else if (e.target.nodeName == "A" && e.target.innerHTML == "Deny") {
      e.target.classList.add("disabled")
      e.target.previousElementSibling.style.display = "none"
    }
  })
}

export { status };
