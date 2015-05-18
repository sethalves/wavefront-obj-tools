#! /bin/sh
#| -*- scheme -*-
exec csi -include-path /usr/local/share/scheme -s $0 "$@"
|#
(use r7rs)
(include "snow/assert.sld")
(include "snow/input-parse.sld")
(include "foldling/command-line.sld")
(include "snow/bytevector.sld")
(include "seth/cout.sld")
(include "seth/strings.sld")
(include "seth/port-extras.sld")
(include "seth/strings.sld")
(include "seth/math-3d.sld")
(include "seth/model-3d.sld")
(include "seth/obj-model.sld")
(include "seth/stl-model.sld")
(include "wavefront-obj-tool-main.sld")


(import (scheme base)
        (wavefront-obj-tool-main))
(main-program)
