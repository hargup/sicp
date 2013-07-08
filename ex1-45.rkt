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
