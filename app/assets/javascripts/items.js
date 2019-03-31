$(function(){
  $('#imageList img').hover(function(){
    $('#imageList img').removeClass("opacity1");
    $('#imageList img').addClass("opacity06");
    $(this).removeClass("opacity06");
    $(this).addClass("opacity1");
    $('#mainImage img').attr('src', $(this).attr('src'));
  });
});
