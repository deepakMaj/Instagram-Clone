import { Controller } from 'stimulus';

export default class extends Controller {

  toggleModal() {
    $("#modal-open").hide();
    $("#modal-open").addClass('hidden');
  }

  openModal() {
    // For new and edit modal
    $("#modal-open").show();
    $("#modal-open").addClass("modalAnimation");
    $("#modal-open").css('display', 'flex');
    $("#modal-more").hide();
  }

  openModalMore() {
    // For more
    $("#modal-more").show();
    $("#modal-more").addClass("modalAnimation");
    $("#modal-more").css('display', 'flex');

  }

  connect() {
    $("#modal-open").on('click', (e) => {
      if ($(e.target).closest('#modal-post').length === 0) {
        $("#modal-open").hide();
      }
    });

    $("#modal-more").on('click', (e) => {
      if ($(e.target).closest('#modal-bodyMore').length === 0) {
        $("#modal-more").hide();
      }
    });
  }

}