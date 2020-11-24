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

//新規投稿の画像プレビュー
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
  // 表示されている画像を変更
  $('#img_preview').attr('src', e.target.result);
    }
    // 取得したurlにアップロード画像のurlを挿入
    reader.readAsDataURL(input.files[0]);
    }
  }
  // 選択された画像に変える
  $("#article_img").change(function(){
    readURL(this);
  });
});
