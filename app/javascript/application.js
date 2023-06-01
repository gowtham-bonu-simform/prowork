// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
  setTimeout(() => {
      const box = document.getElementById('flash-box');
      console.log(box)
      box.style.visibility = 'hidden';
    }, 3000);
});

//= require bootstrap-tagsinput