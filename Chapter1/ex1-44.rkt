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

(define dx 0.0000001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smoothed f n)
  (repeated (smooth f) n))

;; smoothed function increases the value of concave up function
;; ((n-fold-smoothed square 5) 4)
;; gave 1.8446744073709797e+019

