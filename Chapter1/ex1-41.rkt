#lang planet neil/sicp
;; double takes a procedure as an argument and 
;; returns a procedure which applies the procedure twice
(define (double proc)
  (lambda (x)
    (proc (proc x))))
 (((double (double double))inc) 5)
 (((double double)((double double) inc)) 5)
 ;; Produces 21

