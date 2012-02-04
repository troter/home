# -*- coding: utf-8; mode: python -*-

import readline
import rlcompleter
import atexit
import os

readline.parse_and_bind('tab: complete')
histfile = os.path.join(os.environ['HOME'], '.pythonhistory')
try:
    readline.read_history_file(histfile)
except IOError:
    pass

atexit.register(readline.write_history_file, histfile)
del os, histfile, readline, rlcompleter, atexit


# ref: http://tabesugi.net/memo/cur/cur.html#240923
HIRA2KATA = dict( (c, c+96) for c in xrange(0x3041,0x3094) )
def hira2kata(s):
    """与えられたunicode文字列s中のひらがなをカタカナに正規化。"""
    return s.translate(HIRA2KATA)

FULLWIDTH = u"　！”＃＄％＆’（）＊＋，\uff0d\u2212．／０１２３４５６７８９：；＜＝＞？" \
            u"＠ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ［＼］＾＿" \
            u"‘ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ｛｜｝"
HALFWIDTH = u" !\"#$%&'()*+,--./0123456789:;<=>?" \
            u"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_" \
            u"`abcdefghijklmnopqrstuvwxyz{|}"
Z2HMAP = dict( (ord(zc), ord(hc)) for (zc,hc) in zip(FULLWIDTH, HALFWIDTH) )
def zen2han(s):
    """与えられたunicode文字列s中の全角を半角に正規化。"""
    return s.translate(Z2HMAP)

import re
RMSP = re.compile(r'\s+')
def rmsp(s):
    """与えられたunicode文字列s中の余計な空白を除く。"""
    return RMSP.sub(' ', s.strip())
