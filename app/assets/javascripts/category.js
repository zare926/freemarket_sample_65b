var key = ""
$(function(){
  // ページ読み込み時
  $(document).ready(function(){
    $('.category-first').hide();
    $('.category-second').hide();
    $('.category-third').hide();
  });

  // カテゴリータブホバー時
  $('.listsLeft__item--first').hover(function(){
    $('.category-first').show();
  }, function(){
    $('.category-first').hide();
    $('.category-second').hide();
    $('.category-third').hide();
  })

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
  }, function(){

  })

  // 第三階層ホバー時
  $('.category-third').hover(function(){
    $('.category-third').show();
  }, function(){
  })
})