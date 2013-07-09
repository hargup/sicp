#lang planet neil/sicp
(define (pow a b)
  (if (= b 0)
      1
      (* a (pow a (dec b)))))
      
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 1 10)
(A 0 (A 1 9))
(* 2 (A 0 (A 1 8)))
(* 2 (* 2 (A 0 (A 1 7))))
; ...
; (pow 2 10)

(A 2 4)
(A 1 (A 2 3))
;2^(A 2 3)
;2^(2^A(2 2))
;2^(2^(2^A(2 1)))
;2^(2^(2^2)))
(pow 2 16)
(define (hpow a b)
  (if (= b 1)
      a
      (pow a (hpow a (dec b)))))
(hpow 2 4)

      
(A 3 3)
(A 2 (A 3 2))
(hpow 2 (A 3 2))
(hpow 2 (hpow 2 (A 3 1)))
(hpow 2 (hpow 2 2))