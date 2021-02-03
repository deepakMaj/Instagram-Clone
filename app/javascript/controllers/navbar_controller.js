import { Controller } from 'stimulus';

export default class extends Controller {

  connect() {
    $("body").on('click', (e) => {
      if ($(e.target).closest("#drop").length === 0) {
        $("#dropdown").hide(400);
        $("#drop").removeClass("dropActive");
      }
      if ($(e.target).closest("#searchBar").length === 0) {
        $("#searchBox").addClass("hidden");
      }
    });
  }

  openSearch(){
    $("#searchLayer").addClass("hidden")
    $("#searchInput").removeClass("hidden");
  }

  closeSearch(){
    $("#searchInput").addClass("hidden")
    $("#searchLayer").removeClass("hidden");
    $("#query").val("");
    $("#searchBox").addClass("hidden");
    $("#searchList").html("");
  }
  
  toggleDropdown() {
    $("#dropdown").toggle(400);
    $("#drop").addClass("dropActive");
  }

}