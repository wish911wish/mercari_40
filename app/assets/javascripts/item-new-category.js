$(document).on("turbolinks:load", function() {

  function buildCategoriesSelection(categories){

    var selectionItem = '<option value>---</option>' 
    categories.forEach(function(category){
      selectionItem += `<option value="${category.id}">${category.name}</option>`
    })

    var selectWrap = `
    <div class="select-wrap">
      <select class="select-default">
        ${selectionItem}
      </select>
      <i class="fa fa-angle-down fa-2x"></i>
    </div>
    `
    return selectWrap
  }

  function addCategorySection(){
    var categorySection = ["big", "middle", "small"]
    console.log($(".sell-category-option .select-wrap")[0])
    $.each($(".sell-category-option .select-wrap"), function(index){
      console.log(index)
      $("select" ,this).attr({
        "name": `item[${categorySection[index]}_category_id]`,
        "id": `item_${categorySection[index]}_category_id`
      })
    })
  }

  function getSizes(category_id){
    $.ajax({
      url: `${location.origin}/category_sizes/${category_id}`,
      type: "GET",
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(sizes, status){
      if ( sizes.length !== 0 ){
        console.log("サイズ取れた")
      }
    })
    .fail(function(data){
      alert('サイズの取得に失敗しました。')
    })
  }

  $(document).on("change", ".sell-category-option .select-default", function(e) {
    var selectedObject = $(this)
    var category_id = $('option:selected',this).val()
    var url = `${location.origin}/categories/${category_id}`
    $.ajax({
      url: `${location.origin}/categories/${category_id}`,
      type: "GET",
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(categories, status){
      selectedObject.parent().nextAll().remove()
      if ( categories.length !== 0 ){
        selectedObject.parent().after(buildCategoriesSelection(categories))
      }
      addCategorySection()
    })
    .fail(function(data){
      alert('カテゴリーの取得に失敗しました。')
    })
    getSizes(category_id)
  });

})
