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
(define (int-div2 n)
  (if (even? n)
      (/ n 2)
      (/ (- n 1) 2)))

; study and describe the behaviour of this enonious exponentiation fuction.
; You don't have to find our the error in this program but tell what this program will do
(define (fast-exp-iter c n b)
(if (= n 0)
    c
    (if (even? n)
    (fast-exp-iter c (int-div2 n) (* b 2))
    (fast-exp-iter (* c b) (int-div2 n) (* b 2)))))