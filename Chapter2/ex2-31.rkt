#lang planet neil/sicp

(define (square a)
  (* a a))

; tree-map
(define (tree-map func tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (func sub-tree)
             (tree-map func sub-tree)))
       tree))


(define (square-tree tree) (tree-map square tree))

(square-tree (list 1))
(square-tree (list 1 2))
(square-tree (list 1 (list 3)))

#;
(check-expect (square-tree 
               (list 1
                     (list 2 (list 3 4) 5)
                     (list 6 7)))
              (list 1
                    (list 4 (list 9 16) 25)
                    (list 36 49)))

