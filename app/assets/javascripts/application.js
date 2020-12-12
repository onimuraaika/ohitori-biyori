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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

//ページトップへの移動ボタン
$(document).on('turbolinks:load', function() {
  $('#top-arrow-button').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

//新規投稿・投稿編集・会員情報編集の画像プレビュー
$(document).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
  $('#img_preview').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
    }
  }
  $(document).on("change", "#change_img", function() {
    readURL(this);
  });
});

//ハンバーガメニューの表示設定
$(document).on('turbolinks:load', function() {
  $('.hamburger-menu-image').on('click', function () {
    $('.hamburger-menu-lists').toggleClass('open');
  })
});
