#lang planet neil/sicp
#; ;;linear recusion
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; iterative product
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
(check-expect (product identity 1 inc 5) 120)

(define (factorial n)
  (product identity 1 inc n))
(check-expect (factorial 6) 720)

(define (square a)
  (* a a))
(check-expect (square 5) 25)

(define (plus2 a) ( + a 2))
(check-expect (plus2 31) 33)

(define (pi n)
  (* 4.0
     (/
     (* 2 (product square 4 plus2 n) (inc n))
     (product square 3 plus2 (inc n)))))

(pi 10)
(pi 100)
(pi 1000)
(pi 10000)



