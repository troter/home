// ==UserScript==
// @name       Github link for Gitray
// @namespace  https://bitbucket.org/troter/home/raw/default/scripts/userscripts
// @version    0.1.1
// @description  add github link
// @match      http://gitray.com/*
// @copyright  2012+, Takumi IINO
// ==/UserScript==

var $ = unsafeWindow.jQuery;
$(function() {
  $('#tree').each(function() {
    var href = location.href.replace('gitray.com','github.com');
    var github = [
      '<div style="position: absolute; height:2.5%; width:19%; top: 97.5%; padding-left: 5px;">',
      '<a href="',
      href,
      '">',
      href,
      '</a>',
      '</div>'
    ].join('');
    $(this).after(github);
  });
});
