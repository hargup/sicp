#lang planet neil/sicp

;; List -> List
;; Returns a list containing the last element
(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
(check-expect (last-pair '(23 72 149 34)) '(34))

