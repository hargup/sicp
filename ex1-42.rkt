#lang planet neil/sicp

(define (square a)
  (* a a))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(check-expect ((compose square inc) 6) 49)