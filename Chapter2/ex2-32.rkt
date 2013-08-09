#lang planet neil/sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      (lambda (set)
                        (append (list (car s)) set))
                      rest)))))

(check-expect (subsets (list 1 2))
              (list (list) (list 2) (list 1) (list 1 2)))

(check-expect (subsets (list 1 2 3))
              (list (list) 
                    (list 3)
                    (list 2)
                    (list 2 3)
                    (list 1)
                    (list 1 3)
                    (list 1 2)
                    (list 1 2 3)))



