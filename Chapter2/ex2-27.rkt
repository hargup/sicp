#lang planet neil/sicp

(define (reverse items)
  (define (reverse-iter rev orig)
    (if (null? orig)
        rev
    (reverse-iter (append (list (car orig)) rev) (cdr orig))))
  (reverse-iter '() items ))

(check-expect (reverse '(1 2 3 4)) '(4 3 2 1))
(check-expect (reverse '('(1 2) '(3 4))) '('(3 4) '(1 2)))

(define ll2 (list (list 1 2) (list 3 4)))

(define (deep-reverse items)
  (reverse (map reverse items)))
(check-expect (deep-reverse ll2) (list (list 4 3) (list 2 1)))