# Wavefront OBJ Model-File Utilities

This program does various manipulations of [Wavefront OBJ model files](https://en.wikipedia.org/wiki/Wavefront_.obj_file).
In addition to reading, manipulating, and writing OBJ files, it can read from
[STL](https://en.wikipedia.org/wiki/STL_(file_format)) files and export to
[STL](https://en.wikipedia.org/wiki/STL_(file_format)) files or a form of [OpenSCAD](http://www.openscad.org/) input file.

## Installation

This program can be run in various scheme interpreters/compilers: Chibi, CHICKEN, Foment, Gauche, or Sagittarius.  These
instructions assume you're using CHICKEN on Ubuntu.

### Install CHICKEN scheme

`sudo apt install chicken-bin`

### Install some CHICKEN eggs:

`sudo chicken-install srfi-19 srfi-27 srfi-29 srfi-37 srfi-95 http-client openssl udp r7rs ssax sxpath hmac sha1`

### Check out wavefront-obj-tools

`git clone https://github.com/sethalves/wavefront-obj-tools.git`

### Build wavefront-obj-tools

```
cd wavefront-obj-tools
make
sudo make install
```

## running


```
$ /usr/local/bin/wavefront-obj-tool 
give at least one input filename
/usr/local/bin/wavefront-obj-tool [args] input-file.obj ...
  -s scale-factor           scale points by factor
  -d max-dimension          scale model to max-dimension
  --hull                    output convex hull
  --bullet-hull             output hull for bullet physics
  -c                        reuse coincident points
  -C threshold              combine near points
  -n                        flip faces so outsides face as normals
  -p                        print information about model
  --px                      print x-dimension of model
  --py                      print y-dimension of model
  --pz                      print z-dimension of model
  -m scale                  set some texture coordinates
  -M x z                    map a single y-normal texture (use -S also)
  -U                        set up-facing faces to a material (use -S also)
  -T                        set material of upper surface (use -S also)
  -t x y z                  translate model by an offset
  -L material-lib-filename  include the named material library
  -S material-name          set faces in the model to a named material
  -o output-filename        instead of stdout
```
