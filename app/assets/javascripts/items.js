$(function(){
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
        min: 1,
      }
  },
    messages: {
      "item[shipping_date]": {
        min: "選択してください"
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