#lang planet neil/sicp

;; Interger -> Boolean
(define (even? n)
  (= (remainder n 2) 0))
(check-expect (even? 3) #f)
(check-expect (even? 14) #t)




;; Integer -> Integer
;; Calculate b^n
(define (exp b n)
  (define (fast-exp-iter c n b)
    (if (= n 0)
        c
        (if (even? n)
        (fast-exp-iter c (/ n 2) (* b b))
        (fast-exp-iter (* c b) (/ (dec n) 2) (* b b)))))
  (fast-exp-iter 1 n b))
(check-expect (exp 2 3) 8)
(check-expect (exp 3 4) 81)


;; Integer -> Integer
;; Calculates the highest power of a number of which divides n
(define (pow-div a n)
  (define (pow-div-iter a a-p n p)
    (if (= (remainder n a-p) 0)
        (pow-div-iter a (* a a-p) n (inc p))
        p))
  (pow-div-iter a a n 0))
(check-expect (pow-div 2 24) 3)
(check-expect (pow-div 3 18) 2)

(define (cons a b)
  (* (exp 2 a) (exp 3 b)))

(define (car c)
  (pow-div 2 c))

(define (cdr c)
  (pow-div 3 c))

(define C1 (cons 98 23))
(check-expect (car C1) 98)
(check-expect (cdr C1) 23)
