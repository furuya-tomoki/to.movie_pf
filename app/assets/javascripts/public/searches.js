// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery.raty.js

$(function() {
//---以下を追記---
  var search_list = $(".contents");

  function appendmovie(movie) {
    var html = `
               <div class="movie_content">
                 <p class="movie_title">
                   #{movie.title}
                 </p>
               </div>
               `
    search_list.append(html);
   }

  function appendErrMsgToHTML(msg) {
    var html = `
　　　　　　　　　　<div class="movie_content">
                 　<p class="movie_title">
                  　　${ msg }
                 　</p>
                 </div>
　　　　　　　　　`
    search_list.append(html);
  }
//---以上を追記---
  $(".search_input").on("keyup", function() {
    var input = $(".search_input").val();
    $.ajax({
      type: 'GET',
      url: '/movies/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(movies) {
      search_list.empty();
      if (movies.length !== 0) {
        movies.forEach(function(movie){
          appendmovie(movie);
        });
      } else {
        appendErrMsgToHTML("一致する作品はいません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});