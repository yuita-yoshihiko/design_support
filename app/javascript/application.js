// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import jquery from "jquery"
window.$ = jquery

$('input').on('change', function () {
  let file = $(this).prop('files')[0];
  $('.file').text(file.name);
});
