#lang planet neil/sicp
;; procedure to find roots of equations by the half-interval method
(define (average a b)
  (/ (+ a b) 2.0))
(check-expect (average 2 3) 2.5)

(define (abs a)
  (if (> a 0)
      a
      (- a)))
(check-expect (abs -1.45) 1.45)
(check-expect (abs 1.45) 1.45)

(define (close-enough? a b)
  (<  (abs (- a b)) 0.0001))
(check-expect (close-enough? 0 0.00005) #t)
(check-expect (close-enough? 2 3) #f)

(define (search f neg-point pos-point)
  (let (( midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(check-expect (close-enough? (search (lambda (x)
          (+ (* x x) (* 2 x) 1)) 
        (- 2) 
        0) (- 1)) #t)

;; (x + 1)*(x - 3)*(x + 2) 
(check-expect (close-enough? (search (lambda (x)
          ( * (+ x 1) (+ x 2) (- x 3)))
        0
        4) 3) #t)

(define (half-interval-method f a b)
  (let ((a-val (f a))
        (b-val (f b)))
    (if ( negative? (* a-val b-val))
        (if (negative? a)
        (search f a b)
        (search f b a))
         (error "Values are not of opposite sign" a b))))