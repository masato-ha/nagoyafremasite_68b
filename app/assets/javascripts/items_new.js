$(document).on('turbolinks:load', ()=> {
    // 画像が選択された時プレビュー表示、inputの親要素のdivをイベント元に指定
  $('#image-input').on('change', function(e){

    //ファイルオブジェクトを取得する
    let files = e.target.files;
    $.each(files, function(index, file) {
      let reader = new FileReader();

    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    // 既に使われているindexを除外
    lastIndex = $('.preview-image:last').data('index');
    fileIndex.splice(0, lastIndex);

    $('.hidden-destroy').hide();

      //画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
      //アップロードした画像を設定する
      reader.onload = (function(file){
        return function(e){
          let imageLength = $('#output-box').children('li').length;
          // 表示されているプレビューの数を数える

          let labelLength = $("#image-input>label").eq(-1).data('label-id');
          // #image-inputの子要素labelの中から最後の要素のカスタムデータidを取得

          // プレビュー表示
          $('#image-input').before(`<li class="preview-image" id="upload-image${labelLength}" data-image-id="${labelLength}">
                                      <figure class="preview-image__figure">
                                        <img src='${e.target.result}' title='${file.name}' >
                                      </figure>
                                      <div class="preview-image__button">
                                        <a class="preview-image__button__edit">編集</a>
                                        <a class="preview-image__button__delete" data-image-id="${labelLength}">削除</a>
                                      </div>
                                    </li>`);
          $("#image-input>label").eq(-1).css('display','none');
          // 入力されたlabelを見えなくする
          
          if (imageLength < 9) {
            // 表示されているプレビューが９以下なら、新たにinputを生成する
            $("#image-input").append(`<label for="item_images${labelLength+1}" class="sell-container__content__upload__items__box__label" data-label-id="${labelLength+1}">
                                        <input multiple="multiple" class="sell-container__content__upload__items__box__input" id="item_images${labelLength+1}"  type="file" name="item[images_attributes][${imageLength+1}][url]">
                                        <i class="fas fa-camera fa-lg"></i>
                                      </label>`);
            
          };
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });

  $('#image-input').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image_input').append(buildFileField(fileIndex[0]));
  });



  //削除ボタンが押された時
  $(document).on('click', '.preview-image__button__delete', function(){
    let targetImageId = $(this).data('image-id');
    // イベント元のカスタムデータ属性の値を取得
    $(`#upload-image${targetImageId}`).remove();
    //プレビューを削除
    $(`label[data-label-id='${targetImageId}']`).remove();
    //削除したプレビューに関連したinputを削除
  });
  let imageLength = $('#output-box').children('li').length;
  // 表示されているプレビューの数を数える
  // f.text_areaの文字数カウント
  $("textarea").keyup(function(){
    let txtcount = $(this).val().length;
    $("#word-count").text(txtcount);
  });

  //販売価格入力時の手数料計算
  $('#item_price').keyup(function(){
    let price= $(this).val();
    if (price >= 300 && price <= 9999999){
      let fee = Math.floor(price * 0.1);
      // 小数点以下切り捨て
      let profit = (price - fee);
      $('.sell-container__content__commission__right').text('¥'+fee.toLocaleString());
      // 対象要素の文字列書き換える
      $('.sell-container__content__profit__right').text('¥'+profit.toLocaleString());
    } else{
      $('.sell-container__content__commission__right').html('ー');
      $('.sell-container__content__profit__right').html('ー');
    }
  });
    // 各フォームの入力チェック
  $(function(){
    //画像
    $('#image-input').on('focus',function(){
      $('#error-image').text('');
      $('#image-input').on('blur',function(){
        $('#error-image').text('');
        let imageLength = $('#output-box').children('li').length;
        if(imageLength ==''){
          $('#error-image').text('画像がありません');
        }else if(imageLength >10){
          $('#error-image').text('画像を10枚以下にして下さい');
        }else{
          $('#error-image').text('');
        }
      });
    });

    //送信しようとした時
    $('form').on('submit',function(){
      let imageLength = $('#output-box').children('li').length;
      if(imageLength ==''){
        $('body, html').animate({ scrollTop: 0 }, 500);
        $('#error-image').text('画像がありません');
      }else if(imageLength >10){
        $('body, html').animate({ scrollTop: 0 }, 500);
        $('#error-image').text('画像を10枚以下にして下さい');
      }else{
        return true;
      }
    });

     //画像を削除した時
    $(document).on('click','.preview-image__button__delete',function(){
      let imageLength = $('#output-box').children('li').length;
      if(imageLength ==''){
        $('#error-image').text('画像がありません');
      }else if(imageLength >10){
        $('#error-image').text('画像を10枚以下にして下さい');
      }else{
        $('#error-image').text('');
      }
    });

    //商品名
    $('.sell-container__content__name').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-name').text('入力してください');
        $(this).css('border-color','red');
      }else{
        $('#error-name').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //商品説明
    $('.sell-container__content__description').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-text').text('入力してください');
        $(this).css('border-color','red');
      }else{
        $('#error-text').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //状態
    $('#condition-select').on('blur',function(){
      let value = $(this).val();
      if(value == "選択して下さい"){
        $('#error-condition').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-condition').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //送料負担
    $('#delivery_cost-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-delivery_cost').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-delivery_cost').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //配送の方法の表示
    $('#item_trading_status-select').on('blur',function() {
      let value = $(this).val();
      if(value == ""){
        $('#error-item_trading_status').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-item_trading_status').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    })
    //発送元
    $('#pref-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-pref').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-pref').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //発送までの日数
    $('#delivery_days-select').on('blur',function(){
      let value = $(this).val();
      if(value == ""){
        $('#error-delivery_days').text('選択して下さい');
        $(this).css('border-color','red');
      }else{
        $('#error-delivery_days').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });

    //価格
    $('.sell-container__content__price__form__box').on('blur',function(){
      let value = $(this).val();
      if(value < 300 || value > 9999999){
        $('#error-price').text('300以上9999999以下で入力してください');
        $(this).css('border-color','red');
      }else{
        $('#error-price').text('');
        $(this).css('border-color','rgb(204, 204, 204)');
      }
    });
  });  
});
