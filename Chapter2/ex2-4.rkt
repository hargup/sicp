#lang planet neil/sicp
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define a 1)
(define b 2)
(define c (cons 1 2))

(car c)
(c (lambda (p q) p))
((lambda (m) (m a b))
 (lambda (p q) p))
((lambda (p q) p) a b)
a