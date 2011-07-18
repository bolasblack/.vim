import os
import sys

if __name__ == '__main__':
    thedir = sys.argv[1]
    if thedir[-1] != '/':
        thedir += '/'
    cmd = 'dos2unix '
    filelist = os.listdir(thedir)
    try:
        for i in range(0,len(filelist)):
            os.system(cmd + thedir + filelist[i])
    except IOError,e:
            print e
        
    
