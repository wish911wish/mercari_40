$(document).on("turbolinks:load", function() {

  function updateFavorites(method){
    var item_id = $(".item-main-content").attr("item_id")
    $.ajax({
      url: `/items/${item_id}/favorites`,
      type: method,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(favoritesCounts){
      $(".item-button-like").toggleClass("active")
      $(".item-button-like-count").text(favoritesCounts.count)
    })
    .fail(function(data){
      alert('いいね！に失敗しました。')
    })
  }

  $(".item-button-like").on("click", function(e){
    e.stopPropagation();
    e.preventDefault();
    $(this).hasClass('active')
    if ($(this).hasClass('active')){
      updateFavorites("DELETE")
    } else {
      updateFavorites("POST")
    }
  });
})
