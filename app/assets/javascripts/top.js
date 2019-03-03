$(document).on("turbolinks:load", function() {
  console.log("読み込みました")

  $(".js-header-nav-child").hover(function() {
    $(this).parent().parent().children("h3").children().addClass("active")
  }, function() {
    $(this).parent().parent().children("h3").children().removeClass("active")
  });

  $(".js-header-nav-grand-child").hover(function() {
    $(this).parent().parent().children("a").addClass("active")
  }, function() {
    $(this).parent().parent().children("a").removeClass("active")
  });

})
