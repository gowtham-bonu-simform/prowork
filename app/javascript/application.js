// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//=require "animated.headline"
//=require "contact"
//=require "jquery.ajaxchimp.min"
//=require "jquery.form"
//=require "jquery.magnific-popup"
//=require "jquery.nice-select.min"
//=require "jquery.paroller.min"
//=require "jquery.scrollUp.min"
//=require "jquery.slicknav.min"
//=require "jquery.sticky"
//=require "jquery.validate.min"
//=require "mail-script"
//=require "main"
//=require "one-page-nav-min"
//=require "owl.carousel.min"
//=require "plugins"
//=require "popper.min"
//=require "price_rangs"
//=require "slick.min"

import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
  setTimeout(() => {
      const box = document.getElementById('flash-box');
      console.log(box)
      box.style.visibility = 'hidden';
    }, 3000);
});
