$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='sell-collection_select' id= 'grandchildren_wrapper'>
                          <select class="sell-collection_select__label" id="grandchild_category" name="category_id">
                            <option value="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.listing-product-detail__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='sell-collection_select' id= 'grandchildren_wrapper'>
                              <select class="sell-collection_select__label" id="grandchild_category" name="category_id">
                                <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              </select>
                            </div>`;
    $('.listing-product-detail__category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    console.log(parentCategory)
    if (parentCategory != "選択して下さい"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        console.log(children);
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        //$('#size_wrapper').remove();
        //$('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
      //$('#size_wrapper').remove();
      //$('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.listing-product-detail__category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "選択して下さい"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          //$('#size_wrapper').remove();
          //$('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      //$('#size_wrapper').remove();
      //$('#brand_wrapper').remove();
    }
  });
});






// $("#parent-form").on("change",function(){
//   // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
//   var parentValue = document.getElementById("parent-form").value;
// 　　//　("parent-form")は親ボックスのid属性
//   $.ajax({
//     url: '/items/search',
//     type: "GET",
//     data: {
//       parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
//     },
//     dataType: 'json'
// 　　　　//json形式を指定
//   })