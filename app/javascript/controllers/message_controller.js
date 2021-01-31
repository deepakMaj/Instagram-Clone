import { Controller } from 'stimulus';

export default class extends Controller {
  connect() {
    if ($(".msg") !== null) {
      $(".msg").fadeOut(6000);
    }

    if ($("#nav").hasClass("fixed") && $(".msg") !== null) {
      $(".msg").addClass("position");
    }
  }
}