#lang planet neil/sicp

(define (cont-frac-iter n d k res)
  (if (= k 0)
      res
      (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) res)))))

(define (cont-frac n d k)
  (cont-frac-iter n d k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 
             (if (= (remainder (+ i 1) 3) 0)
                 (* 2 (/ (+ i 1) 3))
                 1))
           10)