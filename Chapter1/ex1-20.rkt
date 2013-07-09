#lang planet neil/sicp

 (define (gcd a b)
(if (= b 0)
a
(gcd b (remainder a b))))

 (gcd 206 40)
;; In applicative order the remainder will be called 4 times
;; For normal order the process will be infinite and the remainder will be called 
;; infinitely many times