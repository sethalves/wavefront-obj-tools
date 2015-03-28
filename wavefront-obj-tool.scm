#! /bin/sh
#| -*- scheme -*-
exec csi -include-path /usr/local/share/scheme -s $0 "$@"
|#
(use r7rs)
(include "snow/assert.sld")
(include "snow/input-parse.sld")
(include "foldling/command-line.sld")
(include "seth/cout.sld")
(include "seth/math-3d.sld")
(include "seth/obj-model.sld")


(import (scheme base)
        (scheme write)
        (scheme process-context)
        (seth obj-model)
        (foldling command-line))


(define (main-program)
  (define (usage why)
    (display why)
    (newline)
    (display (car (command-line)))
    (display " [args] input-file.obj ...\n")
    (display "  -s scale-factor           scale points by factor\n")
    (display "  -d max-dimension          scale model to max-dimension\n")
    (display "  -c                        reuse coincident points\n")
    (display
     "  -n                        flip faces so outsides face as normals\n")
    (display "  -o output-filename        instead of stdout\n")
    (exit 1))

  (let* ((args (parse-command-line
                `(((-s -d) ,string->number)
                  (-o output-file)
                  ((-c -n))
                  (-?) (-h))))
         (scale #f)
         (dimension #f)
         (input-files '())
         (output-file #f)
         (compact-points #f)
         (fix-face-normals #f)
         (output-port (current-output-port)))

    (for-each
     (lambda (arg)
       (case (car arg)
         ((-? -h) (usage ""))
         ((-s)
          (if scale (usage "give -s only once"))
          (set! scale (cadr arg)))
         ((-d)
          (if dimension (usage "give -d only once"))
          (set! dimension (cadr arg)))
         ((-o)
          (if output-file (usage "give -o only once"))
          (set! output-file (cadr arg)))
         ((-c)
          (if compact-points (usage "give -c only once"))
          (set! compact-points #t))
         ((-n)
          (if fix-face-normals (usage "give -n only once"))
          (set! fix-face-normals #t))
         ((--)
          (set! input-files (cdr arg)))))
     args)

    (if (and scale dimension) (usage "don't use both -s and -d"))
    (if (null? input-files) (usage "give at least one input filename"))
    (if output-file
        (set! output-port (open-output-file output-file)))

    (let ((model (make-model '() '() '())))
      (let loop ((input-files input-files))
        (cond ((null? input-files)
               (if compact-points (compact-obj-model model))
               (if fix-face-normals (fix-implied-normals model))
               (cond (scale (scale-model model scale))
                     (dimension (size-model model dimension)))
               (write-obj-model model (current-output-port))
               (if output-file (close-output-port output-port)))
              (else
               (read-obj-model-file (car input-files) model)
               (loop (cdr input-files))))))))

(main-program)
