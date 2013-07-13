#lang planet neil/sicp
;; procedure list -> list
;; takes a list and returns a list after applying a filter
(define (filter-list filter items)
  (if (filter (car items))
      (if (null? (cdr items))
          items
          (cons (car items) (filter-list filter (cdr items))))
      (if (null? (cdr items))
          (cdr items)
          (filter-list filter (cdr items)))))
  
;; list -> list
;; takes a list and returns a list of even elements in the list
(define (even-parity items) 
  (filter-list even? items))
(check-expect (even-parity '(1 2 3 4 5)) '(2 4))

;; list -> list
;; takes a list and returns a list of odd elements in the list
(define (odd-parity items)
  (filter-list odd? items))
(check-expect (odd-parity '(1 2 3 4 5)) '(1 3 5))

;; list -> list
;; takes one or more intergers and returns a list of 
;; all the arguments that have the same even-odd parity

(define (same-parity a . b)
  (if (even? a)
      (cons a (even-parity b))
      (cons a (odd-parity b))))
(check-expect (same-parity 1 2 3 4 5 6 7) '(1 3 5 7))
