#
#
#

all:

libs:
	snow2 -p 'http://foldling.org/snow2/index.scm' install '(seth obj-model)' '(foldling command-line)'

clean:
	rm -f *~

very-clean: clean
	rm -rf seth snow srfi foldling
