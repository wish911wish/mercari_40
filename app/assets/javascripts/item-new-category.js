$(document).on("turbolinks:load", function() {

  function getCategories(category_id, selectedObject){
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
        selectedObject.parent().after(buildCategorySelectionHTML(categories))
      }
      addCategorySection()
    })
    .fail(function(data){
      alert('カテゴリーの取得に失敗しました。')
    })
  }

  function buildCategorySelectionHTML(options){
    var selectionItem = '<option value>---</option>' 
    options.forEach(function(option){
      selectionItem += `<option value="${option.id}">${option.name}</option>`
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
    $.each($(".sell-category-option .select-wrap"), function(index){
      $("select" ,this).attr({
        "name": `item[${categorySection[index]}_category_id]`,
        "id": `item_${categorySection[index]}_category_id`
      })
    })
  }

  function getSizes(category_id, selectedObject){
    $(".form-group.sell-size-option").remove()
    $.ajax({
      url: `${location.origin}/category_sizes/${category_id}`,
      type: "GET",
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(sizes, status){
      if ( sizes.length !== 0 ){
        selectedObject.closest('.form-group').after(buildSizesSelectionHTML(sizes))
        addSizeAttr()
      }
    })
    .fail(function(data){
      alert('サイズの取得に失敗しました。')
    })
  }

  function addSizeAttr(){
    $(".sell-size-option select").attr({
      "name": `item[size_id]`,
      "id": `item_size_id`
    })
  }

  function buildSizesSelectionHTML(sizes){
    var selectWrap = `
    <div class="form-group sell-size-option">
      <label for="item_size_id">サイズ
        <span class="form-require">必須</span>
      </label>
      ${buildCategorySelectionHTML(sizes)}
    </div>
    `
    return selectWrap
  }

  $(document).on("change", ".sell-category-option .select-default", function(e) {
    e.stopPropagation();
    var selectedObject = $(this)
    var category_id = $('option:selected',this).val()
    getCategories(category_id, selectedObject)
    getSizes(category_id, selectedObject)
  });

})
