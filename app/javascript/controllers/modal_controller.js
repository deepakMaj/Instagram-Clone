import { Controller } from 'stimulus';

export default class extends Controller {

  toggleModal() {
    $("#modal-open").hide();
    $("#modal-open").addClass('hidden');
  }

  openModal() {
    $("#modal-open").show();
    $("#modal-open").addClass("modalAnimation");
    $("#modal-open").css('display', 'flex');
  }

  connect() {
    $("#modal-open").on('click', (e) => {
      if ($(e.target).closest('#modal-post').length === 0) {
        $("#modal-open").hide();
      }
    });
  }

}