#lang planet neil/sicp
(define x (list 1 2 3))
(define y (list 4 5 6))

(check-expect (append x y) '(1 2 3 4 5 6))
(check-expect (cons x y) '((list 1 2 3) 4 5 6))
(check-expect (list x y) (list (list 1 2 3) (list 4 5 6)))
