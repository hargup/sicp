#lang planet neil/sicp

(define (cont-frac-iter n d k res)
  (if (= k 0)
      res
      (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) res)))))

(define (cont-frac n d k)
  (cont-frac-iter n d k 0.0))

(define (tan-cf x k)
  (cont-frac (lambda (i) 
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i)
               (- (* 2 i) 1))
             k))

(define (close-enough? a b)
  (< (abs (- a b)) 0.0001))

(define pi 3.141592653589793)
; The value of tan are taken from python's tan function in math module
(check-expect (close-enough? (tan-cf 1 10) 1.557407724654902) #t)
(check-expect (close-enough? (tan-cf (/ pi 4) 10) 1) #t)
