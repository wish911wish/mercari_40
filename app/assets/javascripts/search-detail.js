$(document).on("turbolinks:load", function() {

  $(document).on("change", ".js-big-category-option .select-default", function(e) {
    e.stopPropagation();
    var selectedObject = $(this)
    var category_id = $('option:selected',this).val()
    getCategories(category_id, selectedObject)
  });

  $(document).on("change", ".js-middle-category-option .select-default", function(e) {
    e.stopPropagation();
    var selectedObject = $(this)
    var category_id = $('option:selected',this).val()
    buildCategoryCheckBox(category_id, selectedObject)
  });

  $(document).on("change", ".js-size-option .select-default", function(e) {
    e.stopPropagation();
    var selectedObject = $(this)
    var size_group = $('option:selected',this).val()
    buildSizeCheckBox(size_group, selectedObject)
  });

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
        selectedObject.parent().after(buildMiddleCategorySelectionHTML(categories))
      }
    })
    .fail(function(data){
      alert('カテゴリーの取得に失敗しました。')
    })
  }

  function buildMiddleCategorySelectionHTML(options){
    var selectionItem = '<option value>---</option>' 
    options.forEach(function(option){
      selectionItem += `<option value="${option.id}">${option.name}</option>`
    })
    var selectWrap = `
      <div class="select-wrap js-middle-category-option">
        <select class="select-default">
          ${selectionItem}
        </select>
        <i class="fa fa-angle-down fa-2x"></i>
      </div>
      `
    return selectWrap
  }

  function buildCategoryCheckBox(category_id, selectedObject){
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
        selectedObject.parent().after(buildCheckBoxHTML(categories, "small_category"))
      }
    })
    .fail(function(data){
      alert('カテゴリーの取得に失敗しました。')
    })
  }

  function buildSizeCheckBox(size_group, selectedObject){
    $.ajax({
      url: `${location.origin}/size_group/${size_group}`,
      type: "GET",
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(sizes, status){
      selectedObject.parent().nextAll().remove()
      if ( sizes.length !== 0 ){
        selectedObject.parent().after(buildCheckBoxHTML(sizes, "size"))
      }
    })
    .fail(function(data){
      alert('サイズの取得に失敗しました。')
    })
  }

  function buildCheckBoxHTML(options, stuff){
    var checkBox = ""
    options.forEach(function(option){
      checkBox += buildOptionsHTML(option, stuff)
    })
    var selectWrap = `
      <div class="checkbox-container">
        ${checkBox}
      </div>
      `
    return selectWrap
  }

  function buildOptionsHTML(option, stuff){
    var optionsHTML = `
    <div class="checkbox-default">
      <input type="checkbox" name="${stuff}_id[${option.id}]" id="${stuff}_id[${option.id}]" value="true">
      <i class="fa fa-check"></i>
      <label for="${stuff}_id[${option.id}]">${option.name}</label>
    </div>
    `
    return optionsHTML
  }
})

