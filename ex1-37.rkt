#lang planet neil/sicp

(define (cont-frac-rec n d k c) ; c is the counter
  (if (> c k) 
      (/ (n k) (d k))
      (/ (n c) 
         (+ (d c) 
            (cont-frac-rec n d k (+ c 1))))))

(define (cont-frac-iter n d k res)
  (if (= k 0)
      res
      (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) res)))))
#;
(define (cont-frac n d k)
  (cont-frac-rec n d k 1))      

(define (cont-frac n d k)
  (cont-frac-iter n d k 0))

(cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             11)
;; We need to calculate the sum upto 12 places to make it correct upto four decimal places