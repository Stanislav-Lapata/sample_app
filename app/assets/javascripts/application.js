// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .


function limitChars(textid, limit, infodiv)
    {
    var text = $('#'+textid).val();
    var textlength = text.length;
    if(textlength > limit)
    {
    $('#' + infodiv).html('Вам нельзя написать более чем '+limit+' символов!');
    $('#'+textid).val(text.substr(0,limit));
    return false;
    }
    else
    {
    $('#' + infodiv).html('У Вас осталось '+ (limit - textlength) +' символов.');
    return true;
    }
    }
  $(function(){
    $('#micropost_content').keyup(function(){
    limitChars('micropost_content', 140, 'charlimitinfo');
    })
    });
