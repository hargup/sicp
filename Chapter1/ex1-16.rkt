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

(define (fast-exp-iter c n b)
(if (= n 0)
    c
    (if (even? n)
    (fast-exp-iter c (/ n 2) (* b b))
    (fast-exp-iter (* c b) (/ (dec n) 2) (* b b)))))