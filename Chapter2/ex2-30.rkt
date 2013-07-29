#lang planet neil/sicp

; takes a tree as an input and returns a tree with all it's 
; elements squared
#;
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (* sub-tree sub-tree)))
       tree))

(define (square-tree tree)
  (if (null? tree)
      tree
      (if (not (pair? tree))
          (* tree tree)
          (cons (square-tree (car tree))
                (square-tree (cdr tree))))))

(check-expect (square-tree
               (list 1
                     (list 2 (list 3 4) 5)
                     (list 6 7)))
              (list 1
                    (list 4 (list 9 16) 25)
                    (list 36 49)))
