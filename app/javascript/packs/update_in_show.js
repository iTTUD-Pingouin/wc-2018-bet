function clickToUpdateProno() {

  const buttonUpdateInShow = document.querySelector(".btn-to-update-prono-in-show");


  buttonUpdateInShow.addEventListener("click", (event) => {
    const formToUpdate = document.querySelector(".update-prono-in-show");
    formToUpdate.classList.remove("not-show");
    buttonUpdateInShow.classList.add("not-show");
  });

}

export { clickToUpdateProno };
