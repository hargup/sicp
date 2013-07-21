#lang planet neil/sicp
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
 (if (not (> (abs angle) 0.1))
 angle
 (p (sine (/ angle 3.0)))))

;a. 5 times. This number is equal to log_3_(a/0.1)
;b. order of growth
;   space -> log(a)
;   time  -> log(a)

(define (factorial n)
  (define (fact-iter c n prod)
    (if (> c n)
        prod
        (fact-iter (+ c 1) n (* prod c))))
  (fact-iter 1 n 1))
(check-expect (factorial 5) 120)

