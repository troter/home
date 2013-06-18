// ==UserScript==
// @name       Gitray link
// @namespace  https://bitbucket.org/troter/home/raw/default/scripts/userscripts
// @version    0.2
// @description  add gitray link
// @match      https://github.com/*
// @copyright  2012+, Takumi IINO
// ==/UserScript==

var $ = unsafeWindow.jQuery;
$(function() {
  $('input[name="nwo"]').each(function () {
    var repo = $(this).val();

    $('ul.repo-menu').last().each(function () {
      var gitray = [
        '<li class="tooltipped leftwards" original-title="Gitray.com">',
        '<a href="http://gitray.com/',
        repo,
        '" class="js-selected-navigation-item js-disable-pjax" data-selected-links"">',
        '<span class="octicon octicon-link-external"></span> <span class="full-word">Gitray.com</span>',
        '<img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-32.gif" width="16">',
        '</a>',
        '</li>'
      ].join('');
      $(this).last().append(gitray);
    });
  });
});
