import { Controller } from 'stimulus';

export default class extends Controller {

  toggleDropdown() {
    $("#dropdown").toggle(400);
    $("#drop").addClass("dropActive");
  }

  connect() {
    $("body").on('click', (e) => {
      if ($(e.target).closest("#drop").length === 0) {
        $("#dropdown").hide(400);
        $("#drop").removeClass("dropActive");
      }
    });
  }

}