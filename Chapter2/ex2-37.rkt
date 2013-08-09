#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))

(define (first-elems seqs)
  (if (null? seqs)
      nil
      (cons (car (car seqs))
            (first-elems (cdr seqs)))))

(check-expect (first-elems (list (list 1 2 3)
                                 (list 4 5 6)
                                 (list 7 8 9)))
              (list 1 4 7))

(define (except-first-elems seqs)
  (if (null? seqs)
      nil
      (cons (cdr (car seqs))
            (except-first-elems (cdr seqs)))))

(check-expect (except-first-elems (list (list 1 2 3)
                                 (list 4 5 6)
                                 (list 7 8 9)))
              (list (list 2 3)
                    (list 5 6)
                    (list 8 9)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (first-elems seqs))
            (accumulate-n op init (except-first-elems seqs)))))

(check-expect (accumulate-n + 0 (list (list 1 2 3)
                                      (list 4 5 6)
                                      (list 7 8 9)
                                      (list 10 11 12)))
              (list 22 26 30))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(check-expect (dot-product (list 1 1 1)
                           (list 1 1 1))
              3)
(check-expect (dot-product (list 1 2 3)
                           (list 3 2 1))
              10)

#;
(define (transpose mat)
  (if (null? (car mat))
      nil
      (cons (first-elems mat)
            (transpose (except-first-elems mat)))))

(define (transpose mat)
  (accumulate-n cons (list) mat))

(check-expect (transpose (list (list 1 1)
                               (list 0 0)))
              (list (list 1 0)
                    (list 1 0)))

(define (matrix-*-vector m v)
  (map (lambda (r)
         (dot-product r v))
       m))

(check-expect (matrix-*-vector (list (list 1 1)
                                     (list 2 2))
                               (list 1 0))
              (list 1 2))
