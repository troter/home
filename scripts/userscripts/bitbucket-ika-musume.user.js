// ==UserScript==
// @name       bitbucket ika-musume
// @namespace  https://bitbucket.org/troter/home/raw/default/scripts/userscripts
// @version    0.1
// @description  change bitbucket default repository avator to ika-musume
// @match      https://bitbucket.org/*
// @copyright  2012+, Takumi IINO
// ==/UserScript==
var $ = unsafeWindow.jQuery;
$(function() {
  $("img[class='repo-avatar size16']").each(function() {
    if ($(this).attr("src").match(/.*default_16.png/)) {
      $(this).attr({
        src: "https://twimg0-a.akamaihd.net/profile_images/1093514809/t_icon_reasonably_small.gif",
        width: "16px",
        height: "16px"
      });
    }
  });

  $("span[class='repo-avatar-container size32'] > img").each(function() {
    if ($(this).attr("src").match(/.*default_32.png/)) {
      $(this).attr({
        src: "https://twimg0-a.akamaihd.net/profile_images/1093514809/t_icon_reasonably_small.gif",
        width: "32px",
        height: "32px"
      });
    }
  });

  $("span[class='repo-avatar-container size64'] > img").each(function() {
    if ($(this).attr("src").match(/.*default_64.png/)) {
      $(this).attr({
        src: "https://twimg0-a.akamaihd.net/profile_images/1093514809/t_icon_reasonably_small.gif",
        width: "64px",
        height: "64px"
      });
    }
  });
});
