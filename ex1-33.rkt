#lang planet neil/sicp
(define (square a)
  (* a a))

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

(define (prime? n)
  (if (= n 1)
      #f
  (= (smallest-divisor n) n)))
(check-expect (prime? 101) #t)
(check-expect (prime? 323) #f)

(define (accumlate-filter filter func null-val term a next b)
  (if (> a b)
      null-val
      (if (filter a)
      (func (term a)
            (accumlate-filter filter func null-val term (next a) next b))
      (func null-val
            (accumlate-filter filter func null-val term (next a) next b)))))

(check-expect (accumlate-filter even? + 0 identity 1 inc 10) 30)

;; part a
(define (sum-square-prime a b)
  (accumlate-filter prime? + 0 square a inc b))
(check-expect (sum-square-prime 1 5) 38)

;; part b
;; to find the product of all the positive integers less than n 
;; that are relatively prime to n

(define (prod-relative n)
  (define (relatively-prime-n? a)
    (if (< a n)
        (= (gcd a n) 1)
        #f))
  (accumlate-filter relatively-prime-n? * 1 identity 1 inc n))
(check-expect (prod-relative 5) 24)
