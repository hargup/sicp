#lang planet neil/sicp
;; list list -> list
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(check-expect (append '(1 2 3 4) '(5 6 7)) '(1 2 3 4 5 6 7))

;; list -> list
;; takes a list as argument and returns a list of the same elements
;; in reverse order

;; this definition doesn't work because the elements are not combined in the right way
;; check-expect: (reverse '(1 4 9 16 25)) ⇒ ((((25 16) 9) 4) 1)
;; check-expect: Test failed: expected {25 16 9 4 1}
#;
(define (reverse items)
  (if (null? (cdr items))
      (car items)
      (cons (reverse (cdr items)) (cons (car items) nil))))

(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items)) (list (car items)))))

(check-expect (reverse '(1 4 9 16 25)) '(25 16 9 4 1))