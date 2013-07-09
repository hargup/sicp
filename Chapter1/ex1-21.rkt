#lang planet neil/sicp
(define (square a) (* a a))
(check-expect (square 3) 9)


(define (divides? a b)
  (= (remainder b a) 0))
(check-expect (divides? 3 14) #f)
(check-expect (divides? 7 56) #t)

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (inc test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))
(check-expect (smallest-divisor 29) 29)
(check-expect (smallest-divisor 35) 5)

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

