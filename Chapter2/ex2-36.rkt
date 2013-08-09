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
