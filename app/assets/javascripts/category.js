$(function(){
  $('.listsLeft__item--first').hover(function(){
    var html = `
                <ul class="category__tree">
                  <li class="category__tree__item">レディース</li>
                  <li class="category__tree__item">メンズ</li>
                </ul>
                `
    $('.category').append(html);
  }, function(){
    $('.category').empty();
  })
})