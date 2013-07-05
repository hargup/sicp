#lang planet neil/sicp
; a' <- bq + aq + ap
; b' <- bp + aq
; a'' <- b'q + a'q + a'p
; a'' <- bpq + aq2 + (bq + aq + ap)*(q + p)
; a'' <- bqp + aq2 + bq2 + bqp + aq2 + ap2 + 2apq
; a'' <- b(2qp + q2) + a(2q2 + p2 + 2qp)
; b'' <- b'p + a'q
; b'' <- bp2 + bpq + bq2 + apq + aq2
; b'' <- 
; p = p2 + q2
; q = 2pq + q2
; p' = 1, q' = 1
(define (fib n)
(fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
(cond ((= count 0) b)
((even? count)
(fib-iter a
b
(+ (* p p) (* q q)) ; compute p'
(+ (* 2 p q) (* q q)) ; compute q'
(/ count 2)))
(else (fib-iter (+ (* b q) (* a q) (* a p))
(+ (* b p) (* a q))
p
q
(- count 1)))))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)