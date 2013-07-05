#lang planet neil/sicp
; int -> int
; Iterative algo for exponentiation in logarithmic time
; current, power left, b^(2n),
(define (even? n)
  (= (remainder n 2) 0))

(define (fast-exp b n)
  (fast-exp-iter 1 n b))
; current -> c
; power left -> n
; b 
(define (mod2 n)
  (if (even? n)
      (/ n 2)
      (/ (- n 1) 2)))

(define (fast-exp-iter c n b)
(if (= n 0)
    c
    (if (even? n)
    (fast-exp-iter c (mod2 n) (* b b))
    (fast-exp-iter (* c b) (mod2 n) (* b b)))))