// フォーム複製
$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div class="form__box--image" data-index="${index}">
                    <input class="item__image" type="file"
                    name="item[images_attributes][${index}][src]"
                    id="item_images_attributes_${index }_src">
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}" class="preview">
                    <img data-index="${index}" src="${url}" width="124px" height="124px">
                    <div data-index="${index}"  class="item__image-remove">×</div>
                  </div>`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.item__image--group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  // input隠す奴
  $('.image__uplode--btn').on('mousedown',function(){
    const count = $('#previews').find('.item__image-remove').length
    if ( count <= 9 ){
      $('.item__image').last().click();
      $(this).text("画像を選択");
    }else{
      $(this).text("画像は10枚迄です");
    }
  });

  $('.form__box').on('change', '.item__image', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.form__box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('.form__box').on('click', '.item__image-remove', function(){
    const targetIndex = $(this).data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
  
    $(this).remove();
    $(`div[data-index="${targetIndex}"]`).remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.item__image').length == 0) $('.form__box').append(buildFileField(fileIndex[0]));
  });
});

$(function(){
  jQuery.validator.addMethod('selectcheck', function (value) {
    return (value != '選択して下さい');
}, "選択して下さい");

  $.validator.addMethod('my_rule', function(value, element) {
    // お決まりの定型文
    // 検証対象の要素にこのルールが設定されているか
    if ( this.optional( element ) ) {
        return true;
    }
    if (value != "選択してください") {
        return true;
    }
      return false;
  }, '選択してください');

  

  //フォーム指定

  $('#items1').validate({

    rules: {
      "item[name]": {
          required: true,
          maxlength: 40
      }
  },
    messages: {
      "item[name]": {
            required: "入力してください。",
            maxlength: "40文字以内で入力してください。"
        },
    },
    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });

  $('#items2').validate({

    rules: {
      "item[description]": {
          required: true,
          maxlength: 1000
      }
  },
    messages: {
      "item[description]": {
            required: "入力してください。",
            maxlength: "1000文字以内で入力してください。"
        },
    },
    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });

  $('#items4').validate({

    rules: {
      "item[brand]": {
          maxlength: 40
      }
  },
    messages: {
      "item[brand]": {
            maxlength: "お名前は40文字以内で入力してください。"
        },
    },
    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });

  $('#items3').validate({

    rules: {
      "item[category]":{
        selectcheck: true
      },
      "category_id":{
        selectcheck: true
      },
  },



    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });

  $('#items5').validate({

    rules: {
      "item[status]": {
        min: 1,
      }
  },
    messages: {
      "item[status]": {
        min: "選択してください"
        },
    },
    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });

  $('#items6').validate({

    rules: {
      "item[postage]": {
        min: 1,
      }
  },
    messages: {
      "item[postage]": {
        min: "選択してください"
        },
    },
    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });
  
  $('#items8').validate({

    rules: {
      "item[shipping_date]": {
        selectcheck: true
      }
  },
    messages: {
      "item[shipping_date]": {
        selectcheck: "選択してください"
        },
    },
    
    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });

  $('#items9').validate({

    rules: {
      "session[price]": {
        range : [300,9999999]
      }
  },
    messages: {
      "session[price]": {
        range: "300以上9999999以下で入力してください"
        
        },
    },
    errorClass: "invalid",
    errorElement: "p", 
    validClass: "valid", 
  });

  $("#item_name, #item_description, #item_brand, #input").blur(function () {
    $(this).valid();
  });
  $("#input").on("keyup keydown change",function(event){
    $(this).valid();
});

  $('button').click(function() {
    var value = $('select').val();
    console.log(value);
  })
  
  
  $('#input').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#input').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.top__main__center__price__box__center__minus').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.top__main__center__price__box__center__minus').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.top__main__center__price__box__bottom__minus').html(profit)
    $('.top__main__center__price__box__bottom__minus').prepend('¥')
    $('#price').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(profit == '') {   // もし､計算結果が''なら表示も消す｡
    $('.top__main__center__price__box__bottom__minus').html('');
    $('.top__main__center__price__box__bottom__minus').html('');
    }
  })
});



