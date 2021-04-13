$(function() {

  var search_list = $(".showZone");

  function appendReview(review) {

    search_list.append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/reviews/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(reviews) {
      search_list.empty();
      if (reviews.length !== 0) {
        reviews.forEach(function(review){
          appendReview(review);
        });
      }
      else {
        appendErrMsgToHTML("一致するのがありません");
      }
    })
  });
};