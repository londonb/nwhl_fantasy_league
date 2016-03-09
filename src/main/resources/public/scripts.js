$(document).ready(function() {

  // jQuery to filter players in draft

  $("button#g").click(function () {
    $("div.radio").addClass("hidden");
    $("div.G").removeClass("hidden");
  });

  $("button#d").click(function () {
    $("div.radio").addClass("hidden");
    $("div.D").removeClass("hidden");
  });

  $("button#f").click(function () {
    $("div.radio").addClass("hidden");
    $("div.F").removeClass("hidden");
  });

  $("button#all").click(function () {
    $("div.radio").removeClass("hidden");
  });
});
