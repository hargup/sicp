#lang planet neil/sicp
(define (square a)
  (* a a))
(define (square-sum a b) 
  (square (+ a b)))

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
;(define (+ a b)
;  ( if (= a 0)
;       b 
;       (inc (+ (dec a) b))))

;(+ 4 5)
;(inc ( + 3 5))
;(inc (inc ( + 2 5)))
;(inc (inc (inc (+ 1 5))))
;(inc (inc (inc (inc (+ 0 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;9

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))
(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ 1 8)
(+ 0 9)
9