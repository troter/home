#!/usr/bin/env python

import re

def merge_conflicts(difflines):
    #
    linenum, header = 0, False

    for line in difflines:

        line = line.rstrip('\r\n')
        if header:
            # remember the name of the file that this diff affects
            m = re.match(r'(?:---|\+\+\+) ([^\t]+)', line)
            if m and m.group(1) != '/dev/null':
                filename = m.group(1).split('/', 1)[-1]
            if line.startswith('+++ '):
                header = False
            continue
        if line.startswith('diff '):
            header = True
            continue

        # hunk header - save the line number
        m = re.match(r'@@ -\d+,\d+ \+(\d+),', line)
        if m:
            linenum = int(m.group(1))
            continue
        # hunk body - check for an added line with conflict marker
        m = re.match(r'^\+(<{7} .|={7}$|>{7} .)', line)
        if m:
            yield filename, linenum
        if line and line[0] in ' +':
            linenum += 1

if __name__ == '__main__':
    import os, sys

    added = 0
    for filename, linenum in merge_conflicts(os.popen('hg export tip')):
        print >> sys.stderr, ('file %s, line %d: conflict marker added' %
                              (filename, linenum))
        added += 1
    if added:
        os.system('hg tip --template "{desc}" > .hg/commit.save')
        print >> sys.stderr, 'commit message saved to .hg/commit.save'
        sys.exit(1)
