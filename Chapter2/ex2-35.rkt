#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map 
                   (lambda (sub-tree)
                     (if (not (list? sub-tree))
                          1
                          (count-leaves sub-tree)))
                   t)))

(check-expect (count-leaves (list 1 2 3 4)) 4)
(check-expect (count-leaves (list (list 1 2 3) 
                                  (list 1 2 3) 
                                  1 2 3)) 
              9)

#;
(define (count-leaves t)
  (accumulate ))