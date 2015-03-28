#
#
#

all: wavefront-obj-tool

wavefront-obj-tool: wavefront-obj-tool.scm
	csc -X r7rs $^ -o $@

install: wavefront-obj-tool
	cp $^ /usr/local/bin/

uninstall:
	rm -f /usr/local/bin/wavefront-obj-tool

libs:
	snow2 -p 'http://foldling.org/snow2/index.scm' install '(seth obj-model)' '(foldling command-line)'

clean:
	rm -f *~ wavefront-obj-tool

very-clean: clean
	rm -rf seth snow srfi foldling
