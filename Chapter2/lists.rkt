#lang planet neil/sicp

(define one-through-four (list 1 2 3 4))
one-through-four
(list 1 2 3 4)

;; list -> listItem
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(check-expect (list-ref one-through-four 2) 3)

;; list -> Interger
#;
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

; iterative definition
(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count 
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(check-expect (length one-through-four) 4)

;; list list -> list
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(check-expect (append '(1 2 3 4) '(5 6 7)) '(1 2 3 4 5 6 7))