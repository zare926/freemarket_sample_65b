$(document).on('turbolinks:load', ()=>{
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='top__main__center__deta__box__input-box' id= 'children_wrapper'>
                          <select class="top__main__center__deta__box__input-box__form__select" id="child_category" name="item[category_id]">
                            <option value= "選択して下さい" data-category="選択して下さい">選択して下さい</option>
                            ${insertHTML}
                          </select>
                        </form>
                      </div>`;
    $('.top__main__center__deta__box__input-box__form-category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='top__main__center__deta__box__input-box' id= 'grandchildren_wrapper'>
                              <select class="top__main__center__deta__box__input-box__form__select" id="grandchild_category" name="item[category_id]">
                                <option value= "選択して下さい" data-category="選択して下さい">選択して下さい</option>
                                ${insertHTML}
                              </select>
                            </form>
                          </div>`;
    $('.top__main__center__deta__box__input-box__form-category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#select1').on('change', function(){
    var parentCategory = document.getElementById('select1').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != ""){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { productcategory: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.top__main__center__deta__box__input-box__form-category').on('change', '#child_category', function(){
    var childId = document.getElementById('child_category').value; //選択された子カテゴリーのidを取得
    if (childId != "選択して下さい"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { productcategory: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

var key = ""
$(function(){
  // ページ読み込み時
  // $(document).ready(function(){
  //   $('.category-first').hide();
  //   $('.category-second').hide();
  //   $('.category-third').hide();
  // });

  // カテゴリータブホバー時
  $('.listsLeft__item--first').hover(function(){
    $('.category-first').show();
  }, function(){
    $('.category-first').hide();
    $('.category-second').hide();
    $('.category-third').hide();
  })
});

  // 第一階層ホバー時
  $('.category-first__tree').hover(function(){
    key = this.id
    $('.category-second').show();
    $('.category-second__tree').each(function(i,e){
      if ($(e).attr('parent_id') == key){
      } else{
        $(e).hide();
      }
    });
    $('.category-third__tree').each(function(i,e){
      $(e).show();
    });
    $('.category-third').hide();
  }, function(){
    $('.category-second').hide();
  })

  // 第二階層ホバー時
  $('.category-second__tree').hover(function(){
    key = this.id
    $('.category-second').show();
    $('.category-third').show();
    $('.category-third__tree').each(function(i,e){
      $(e).show();
      if ($(e).attr('parent_id') == key){
      } else{
        $(e).hide();
      }
    });
  })

  // 第三階層ホバー時
  $('.category-third').hover(function(){
    $('.category-third').show();
  }, function(){
  })
})