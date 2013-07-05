#lang planet neil/sicp

(define (double a)
  (+ a a))
(define (even? a)
  (= (remainder a 2) 0))
(define (half a)
  (if (even? a)
      (/ a 2)
      (/ (- a 1) 2)))
  
 (define (fast-mul a b)
   (fast-mul-iter a b b))
  
 (define (fast-mul-iter a b n)
   (if (= a 1)
       n
       (if (even? a)
           (fast-mul-iter (half a) (double b) (+ n b))
           (fast-mul-iter (half a) (double b) (+ n (double b))))))
; It is not particularly clear how this works. I got it through trial and error
; and some intution. Well I must prove it indeed multiply numbers. What I though was 
; to convert a to binary and apply repeated addition
; let a = (11 ... 0100)_2
; so b*a = 0*b + 0*b*2 + 1*b*2^2 + 0*b*2^3 ...
; everytime b doubles
 
 
(define (fast-mul2 a b)
  (fast-mul2-iter a b 0))
(define (fast-mul2-iter a b n)
  (if (= a 0)
      n
      (if (even? a)
          (fast-mul2-iter (half a) (double b) n)
          (fast-mul2-iter (half a) (double b) (+ n b))
          )))
(check-expect (fast-mul2 5 7) 35)
; Well this new fast-mul2 also seems to work. Good !!!
; But why is above one working?
(define (fast-mul-rec a b)
  (if (= a 1)
      b
      (if (even? a)
       (fast-mul-rec (half a) (double b))
       (+ (fast-mul-rec (half (+ a 1)) b)  (fast-mul-rec (half (- a 1)) b)))))
(check-expect (fast-mul-rec 5 7) 35)