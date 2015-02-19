# vlc_installer

all:
	make -f win32.mak all
	make -f win64.mak all

dist:
	make -f win32.mak dist
	make -f win64.mak dist

clean:
	make -f win32.mak clean
	make -f win64.mak clean

distclean:
	make -f win32.mak distclean
	make -f win64.mak distclean

realclean:
	make -f win32.mak realclean
	make -f win64.mak realclean

.PHONY:	all clean dist distclean realclean
