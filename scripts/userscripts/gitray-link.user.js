// ==UserScript==
// @name       Gitray link
// @namespace  https://bitbucket.org/troter/home/raw/default/scripts/userscripts
// @version    0.1
// @description  add gitray link
// @match      https://github.com/*
// @copyright  2012+, Takumi IINO
// ==/UserScript==

var $ = unsafeWindow.jQuery;
$(function() {
  if ($('input[name="nwo"]')) {
    var gitray = [
      '<li><a class="tabnav-tab" href="http://gitray.com/',
      $('input[name="nwo"]').val(),
      '">Gitray.com</a></li>'
    ].join('');
    $('ul.tabnav-tabs').last().append(gitray);
  }
});
