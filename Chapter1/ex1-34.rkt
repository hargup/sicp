#lang planet neil/sicp
(define (square a) (* a a))
(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

(f f )
;; f accepts a procedure with one argument 
;; f doesn't Fulfil The Requirement
