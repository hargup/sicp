#lang planet neil/sicp

(define (square a)
  (* a a))
(check-expect (square 3) 9)

#;
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map square items))
(check-expect (square-list (list 1 2 3 4)) (list 1 4 9 16))
