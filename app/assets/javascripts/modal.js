document.addEventListener(
  "DOMContentLoaded", e => {
    var modal_open = document.getElementById("modal-open-btn");
    modal_open.addEventListener("click", e => {
      $('#overlay, #modalWindow').fadeIn();
      $('#modal-close-btn').on('click', function () {
        $('#overlay, #modalWindow').fadeOut();
      });
      document.getElementById("delete-comformation-btn").onclick = function () {
        document.getElementById("item-delete-btn").click();
      };
    });
  },
  false
);