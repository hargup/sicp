#lang planet neil/sicp

(define (for-each proc items)
  (proc (car items))
  (if (null? (cdr items))
      nil
      (for-each proc (cdr items))))

(for-each display '(1 2 3))
