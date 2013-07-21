#lang planet neil/sicp

(define (not-tree items)
  (if (list? (car items))
      false
      (if (null? (cdr items))
          true
          (not-tree (cdr items)))))

(check-expect (not-tree (list 1 2 3 4 5)) true)
(check-expect (not-tree (list (list 1 2) 3 4)) false)
(check-expect (not-tree (list 1 2 (list 3 4))) false)

(define (fringe tree)
  (if (not-tree tree)
      tree
      (if (list? (car tree))
          (if (not (null? (cdr tree)))
              (append (fringe (car tree))
                      (fringe (cdr tree)))
              (fringe (car tree)))
          (append (list (car tree)) (fringe (cdr tree))))))
          
          
(fringe (list 1 2))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
(append (fringe (car x)) (fringe (cdr x)))

(check-expect (fringe x) (list 1 2 3 4))
(check-expect (fringe (list x x)) (list 1 2 3 4 1 2 3 4))
