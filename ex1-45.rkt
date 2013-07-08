#lang planet neil/sicp

(define (square a)
  (* a a))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(check-expect ((compose square inc) 6) 49)

(define (repeated f n)
  (define (repeated-iter f-n f n)
    (if (= n 0)
        f-n
        (if (even? n)
            (repeated-iter f-n (compose f f) (/ n 2))
            (repeated-iter (compose f-n f) (compose f f) (/ (dec n) 2)))))
  (repeated-iter f f (dec n)))

(check-expect ((repeated square 2) 5) 625)

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (n-times-average-damp f n)
  (repeated (average-damp f) n))
(define (average a b)
  (/ (+ a b) 2.0))
(check-expect (average 2 3) 2.5)

(define (abs a)
  (if (> a 0)
      a
      (- a)))
(check-expect (abs -1.45) 1.45)
(check-expect (abs 1.45) 1.45)

(define tolerance 0.00000001)
(define (close-enough? a b)
  (> tolerance (abs (- a b))))
(check-expect (close-enough? 3 (+ 3 (/ tolerance 2))) #t)
(check-expect (close-enough? 3 4) #f)

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next 
          (try next))))
  (try first-guess))

(define (sqrt a)
  (fixed-point (average-damp 
                (lambda (x) (/ a x))) 
               0.1))

(sqrt 3.0)

(define (exp b n)
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
#;
(define (nthroot a n)
  (fixed-point ((repeated average-damp 2)
                 (lambda (x) (/ a (exp x (- n 1))))) 1))

(define (nthroot a n)
  (fixed-point (average-damp (average-damp 
                 (lambda (x) (/ a (exp x (- n 1)))))) 1)) 
(define (cuberoot a)
  (nthroot a 3))
(cuberoot 8)
