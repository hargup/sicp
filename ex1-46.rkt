#lang planet neil/sicp

(define (Iterative-improve good-enough? next)
  (define (Iterative-improve-helper guess)
    (if (good-enough? guess)
        guess
        (Iterative-improve-helper (next guess))))
  Iterative-improve-helper)

(define tolerance 0.00001)

(define (sqrt n)
  (define (good-enough? guess) 
    (< (abs (- (* guess guess)n)) tolerance))
  (define (next guess)
    (/ (+ guess (/ n guess)) 2))
  ((Iterative-improve good-enough? next) n))

(sqrt 3)

(define (fixed-point f guess)
  (define (good-enough? x)
    (< (abs (- x (f x))) tolerance))
  (define (next x)
    (/ (+ x (f x)) 2))
  ((Iterative-improve good-enough? next) guess))

(fixed-point (lambda (x) (+ x (sin x))) 1)