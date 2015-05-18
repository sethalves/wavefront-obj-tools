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
	snow2 -p 'http://foldling.org/snow2/index.scm' install '(seth obj-model)' '(seth stl-model)' '(foldling command-line)'

link-libs: very-clean
	snow2 -s \
	      -p 'http://foldling.org/snow2/index.scm' \
	      -p '../snow2-packages/seth' \
              install '(seth obj-model)' '(seth stl-model)' '(foldling command-line)'

clean:
	rm -f *~ wavefront-obj-tool

very-clean: clean
	rm -rf seth snow srfi foldling
