import glob
import re

s = str(input('Input Searching Text : '))

p = re.compile(s)

for i in glob.glob(r'D:\test\*.txt'):
    with open(i, 'r') as f:
        for x, y in enumerate(f.readlines(),1):
            m = p.findall(y)
            if m:
                print('File %s [ %d ] Line Searching : %s' %(i,x,m))
                print('Full Line Text : %s' %y)
        print()