#lang planet neil/sicp

(define (square a)
  (* a a))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(check-expect ((compose square inc) 6) 49)

;; this uses an iterative method to compute f(f...n times ...(f (x))
;; to compute it in n steps
#;
(define (repeated f n)
  (define (repeated-iter f f-k k n)
    (if (= k n)
        f-k
        (repeated-iter f (compose f f-k) (inc k) n)))
  (repeated-iter f f 1 n))

;; (repeated f n) can be computed in logarithmic steps if
;; (compose ((repeated f a) (repeated f b))) and (compose ((repeated f b) (repeated f a))) are same
;; This is true (I have not formally proved it)

(define (repeated f n)
  (define (repeated-iter f-n f n)
    (if (= n 0)
        f-n
        (if (even? n)
            (repeated-iter f-n (compose f f) (/ n 2))
            (repeated-iter (compose f-n f) (compose f f) (/ (dec n) 2)))))
  (repeated-iter f f (dec n)))

(check-expect ((repeated square 2) 5) 625)




