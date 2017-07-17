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
	snow2 -p 'http://foldling.org/snow2/index.scm' install '(seth obj-model)' '(seth stl-model)' '(seth scad-model)' '(foldling command-line)' '(seth octree)' '(snow random)' '(seth graph)'

link-libs: very-clean
	snow2 -s \
	      -p 'http://foldling.org/snow2/index.scm' \
	      -p '../snow2-packages/seth' \
	      -p '../snow2-packages/snow' \
		  -p '../seth-snow2-misc' \
	install '(seth obj-model)' '(seth stl-model)' '(seth scad-model)' '(foldling command-line)' '(seth octree)' '(snow random)' '(seth graph)'

clean:
	rm -f *~ wavefront-obj-tool

very-clean: clean
	rm -rf seth snow srfi foldling
