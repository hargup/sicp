#lang planet neil/sicp

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result a))))
  (iter a 0))
(check-expect (sum identity 1 inc 5) 15)
    
(define (repeated f term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (f result a))))
  (iter (inc a) a))

(check-expect (repeated + identity 1 inc 5) 15)

