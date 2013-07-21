#lang planet neil/sicp

; list -> bool
; Determines if a list does not contains lists as values
(define (not-tree? items)
  (if (list? (car items))
      false
      (if (null? (cdr items))
          true
          (not-tree? (cdr items)))))
(check-expect (not-tree? (list 1)) true)
(check-expect (not-tree? (list (list 2 3) 1)) false)

(define ll1 (list 1 2 3 4))
(define ll2 (list (list 1 2) (list 3 4)))
(define ll3 (list (list 1 2 (list 3 4)) 5 6))

#;
(define (deep-reverse items)
  (reverse (map reverse items)))
; This works only if the list contains lists upto second level
; and it also passed the test case
; This shows it is important to test the function extensively and carefully


; list -> list
; returns a list with its elements reversed and with all sublists deep-reversed as wel
(define (deep-reverse items)
  (if (list? items)
      (if (not-tree? items)
          (reverse items)
          (reverse (map deep-reverse items)))
      items))

(check-expect (deep-reverse ll1) (list 4 3 2 1))
(check-expect (deep-reverse ll2) (list (list 4 3) (list 2 1)))
(check-expect (deep-reverse ll3) (list 6 5 (list (list 4 3) 2 1)))