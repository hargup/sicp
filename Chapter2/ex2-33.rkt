#lang planet neil/sicp
(define (square a)
  (* a a))
 
(define (cube x)
  (* x x x))

(define (accumlate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) 
          (accumlate op initial (cdr sequence)))))

(define (map p sequence)
  (accumlate (lambda (x y) 
               (cons (p x) 
                     y))
             nil
             sequence))

(check-expect (map identity (list 1 2 3)) (list 1 2 3))
(check-expect (map square (list 1 2 3)) (list 1 4 9))
