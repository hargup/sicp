#lang planet neil/sicp

(define (sum term a next b)
(if (> a b)
0
(+ (term a)
(sum term (next a) next b))))

(define (cube a)
  (* a a a))
(check-expect (cube 3) 27)

(check-expect (sum identity 1 inc 5) 15)
(check-expect (sum cube 2 inc 4) 99)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(check-expect (product identity 1 inc 3) 6)

;; repeated function

(define (repeated func term a next b)
  (if (> a (dec b))
      b
      (func (term a)
            (repeated func term (next a) next b))))
(check-expect (repeated + identity 1 inc 5) (sum identity 1 inc 5))

#;
(define (integral f a b dx)
(define (add-dx x) (+ x dx))
(* (sum f (+ a (/ dx 2.0)) add-dx b)
dx))

; (integral cube 0 1 0.00001)

;; Simpson's Rule
(define (integral f a b n )
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* h k))))
  (define (four-time a) (* a 4))
  (define (double a) (* a 2))
  (define (add-two a) (+ a 2))
  (* (+ (y 0) (y n)
     (four-time (sum y (+ a 1) add-two (- n 1)))
     (double (sum y (+ a 2) add-two (- n 2))))
     (/ h 3)))

(integral cube 0 1 2)
(integral cube 0 1 10)
(integral cube 0 1 100)
(integral cube 0 1 1000)
     
