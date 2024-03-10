# wrapper file of diff-highlight
import imp
try:
  imp.find_module('highlights')
except ImportError:
  pass # diff-highlight not installed.
else:
  from diff_highlight import *
