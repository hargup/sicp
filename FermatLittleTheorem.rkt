#lang planet neil/sicp
;; Fermats Little Theorem
;; if a<n and n is a prime
;; a^n and a are congurent modulo n
;; => (remainder (pow a n) n) = a
;; a^n = p*n + q
;; n = (a^n - q)/p
(define (square a) (* a a))
(define (expmod base exp m)
(cond ((= exp 0) 1)
((even? exp)
(remainder (square (expmod base (/ exp 2) m))
m))
(else
(remainder (* base (expmod base (- exp 1) m))
m))))

(define (fermat-test n)
(define (try-it a)
(= (expmod a n n) a))
(try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
(cond ((= times 0) true)
((fermat-test n) (fast-prime? n (- times 1)))
(else false)))