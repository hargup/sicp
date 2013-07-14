#lang planet neil/sicp
;; Number -> Number
;; Produces the square of a number
(define (square a)
  (* a a))
(check-expect (square 3) 9)
;; the first method produces the answer in reverse order 
;; because the square of every new element extracted from 
;; the list is appended to the beginning of the new list

(define (square-list items)
  (define (iter things answer)
  (if (null? things)
    answer
(iter (cdr things)
      (cons answer
      (square (car things))))))
  (iter items nil))
(check-expect (square-list '(1 2 3)) '(1 4 9))

;; Now though the order is correct the procudure fails because the
;; resulting list always have a nil element in the beginning
;; also the order in which elements are paired is not correct
;; here it is something like
;; (cons (cons (cons (cons (square elem1)) (square elem2))(square elem3)) nil)